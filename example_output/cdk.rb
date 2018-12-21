name :
	 Cdk
homepage :
	 https://invisible-island.net/cdk/
url :
	 https://invisible-mirror.net/archives/cdk/cdk-5.0-20180306.tgz
description :
	 Curses development kit provides predefined curses widget for apps
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--with-ncurses"
	 system "make", "install"
