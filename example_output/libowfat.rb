name :
	 Libowfat
homepage :
	 https://www.fefe.de/libowfat/
url :
	 https://www.fefe.de/libowfat/libowfat-0.31.tar.xz
description :
	 Reimplements libdjb
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "libowfat.a"
	 system "make", "install", "prefix=#{prefix}", "MAN3DIR=#{man3}", "INCLUDEDIR=#{include}/libowfat"
