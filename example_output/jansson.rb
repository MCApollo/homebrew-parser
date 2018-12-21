name :
	 Jansson
homepage :
	 http://www.digip.org/jansson/
url :
	 http://www.digip.org/jansson/releases/jansson-2.12.tar.gz
description :
	 C library for encoding, decoding, and manipulating JSON
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
