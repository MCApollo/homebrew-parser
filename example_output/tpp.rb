name :
	 Tpp
homepage :
	 https://synflood.at/tpp.html
url :
	 https://synflood.at/tpp/tpp-1.3.1.tar.gz
description :
	 Ncurses-based presentation tool
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['ncurses-ruby']
	 ['https://downloads.sourceforge.net/project/ncurses-ruby.berlios/ncurses-ruby-1.3.1.tar.bz2']
patches :
EOF_patch :
install :
	 lib_ncurses = libexec+"ncurses-ruby"
	 inreplace "tpp.rb", 'require "ncurses"', <<~EOS
	 require File.expand_path('#{lib_ncurses}/ncurses_bin.bundle', __FILE__)
	 require File.expand_path('#{lib_ncurses}/ncurses_sugar.rb', __FILE__)
	 EOS
	 bin.install "tpp.rb" => "tpp"
	 share.install "contrib", "examples"
	 man1.install "doc/tpp.1"
	 doc.install "README", "CHANGES", "DESIGN", "COPYING", "THANKS", "README.de"
	 resource("ncurses-ruby").stage do
	 inreplace "ncurses_wrap.c", '#include "ncurses_wrap.h"',
	 "#include \"ncurses_wrap.h\"\n#include <sys/time.h>"
	 inreplace "extconf.rb", '$CFLAGS  += " -g"',
	 '$CFLAGS  += " -g -DNCURSES_OPAQUE=0"'
	 system "ruby", "extconf.rb"
	 system "make"
	 lib_ncurses.install "lib/ncurses_sugar.rb", "ncurses_bin.bundle"
	 end
