name :
	 Libp11
homepage :
	 https://github.com/OpenSC/libp11/wiki
url :
	 https://downloads.sourceforge.net/project/opensc/libp11/libp11-0.2.8.tar.gz
description :
	 PKCS#11 wrapper library in C
build_deps :
	 pkg-config
link_deps :
	 libtool
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./bootstrap" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
