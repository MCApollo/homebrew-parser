name :
	 Dhex
homepage :
	 http://www.dettus.net/dhex/
url :
	 http://www.dettus.net/dhex/dhex_0.68.tar.gz
description :
	 Ncurses based advanced hex editor featuring diff mode and more
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile", "$(DESTDIR)/man", "$(DESTDIR)/share/man"
	 bin.mkpath
	 man1.mkpath
	 man5.mkpath
	 system "make", "install", "DESTDIR=#{prefix}"
