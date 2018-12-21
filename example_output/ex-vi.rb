name :
	 ExVi
homepage :
	 https://ex-vi.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ex-vi/ex-vi/050325/ex-050325.tar.bz2
description :
	 UTF8-friendly version of tradition vi
build_deps :
link_deps :
conflicts :
	 vim
patches :
EOF_patch :
install :
	 system "make", "install", "INSTALL=/usr/bin/install",
	 "PREFIX=#{prefix}",
	 "PRESERVEDIR=/var/tmp/vi.recover",
	 "TERMLIB=ncurses"
