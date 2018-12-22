name :
	 Libstfl
homepage :
	 http://www.clifford.at/stfl/
url :
	 http://www.clifford.at/stfl/stfl-0.24.tar.gz
description :
	 Library implementing a curses-based widget set for terminals
build_deps :
	 swig
link_deps :
	 ruby
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "LDLIBS", "-liconv"
	 ENV.append "LIBS", "-lncurses -liconv -lruby"
	 %w[
	 stfl.pc.in
	 perl5/Makefile.PL
	 ruby/Makefile.snippet
	 ].each do |f|
	 inreplace f, "ncursesw", "ncurses"
	 end
	 inreplace "stfl_internals.h", "ncursesw/ncurses.h", "ncurses.h"
	 inreplace "Makefile" do |s|
	 s.gsub! "ncursesw", "ncurses"
	 s.gsub! "-Wl,-soname,$(SONAME)", "-Wl"
	 s.gsub! "libstfl.so.$(VERSION)", "libstfl.$(VERSION).dylib"
	 s.gsub! "libstfl.so", "libstfl.dylib"
	 end
	 inreplace "python/Makefile.snippet" do |s|
	 s.change_make_var! "PYTHON_SITEARCH", lib/"python2.7/site-packages"
	 s.gsub! "lib-dynload/", ""
	 s.gsub! "ncursesw", "ncurses"
	 s.gsub! "gcc", "gcc -undefined dynamic_lookup #{`python-config --cflags`.chomp}"
	 s.gsub! "-lncurses", "-lncurses -liconv"
	 end
	 ENV.deparallelize
	 system "make"
	 inreplace "perl5/Makefile", "Network/Library", libexec/"lib/perl5"
	 system "make", "install", "prefix=#{prefix}"
