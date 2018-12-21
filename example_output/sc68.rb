name :
	 Sc68
homepage :
	 http://sc68.atari.org/project.html
url :
	 https://downloads.sourceforge.net/project/sc68/sc68/2.2.1/sc68-2.2.1.tar.gz
description :
	 Play music originally designed for Atari ST and Amiga computers
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--infodir=#{info}"
	 system "make", "install"
