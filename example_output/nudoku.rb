name :
	 Nudoku
homepage :
	 https://jubalh.github.io/nudoku/
url :
	 https://github.com/jubalh/nudoku/archive/1.0.0.tar.gz
description :
	 ncurses based sudoku game
build_deps :
	 autoconf
	 automake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
