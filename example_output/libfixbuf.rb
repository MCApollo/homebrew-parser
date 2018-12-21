name :
	 Libfixbuf
homepage :
	 https://tools.netsa.cert.org/fixbuf/
url :
	 https://tools.netsa.cert.org/releases/libfixbuf-2.1.0.tar.gz
description :
	 Implements the IPFIX Protocol as a C library
build_deps :
	 pkg-config
link_deps :
	 glib
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make"
	 system "make", "install"
