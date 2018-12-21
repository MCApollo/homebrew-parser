name :
	 Xa
homepage :
	 https://www.floodgap.com/retrotech/xa/
url :
	 https://www.floodgap.com/retrotech/xa/dists/xa-2.3.8.tar.gz
description :
	 6502 cross assembler
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}",
	 "CFLAGS=#{ENV.cflags}",
	 "DESTDIR=#{prefix}",
	 "install"
