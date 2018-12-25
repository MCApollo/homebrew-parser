name :
	 TtySolitaire
homepage :
	 https://github.com/mpereira/tty-solitaire
url :
	 https://github.com/mpereira/tty-solitaire/archive/v1.1.1.tar.gz
description :
	 Ncurses-based klondike solitaire game
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "PREFIX=#{prefix}"
