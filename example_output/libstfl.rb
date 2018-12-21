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
