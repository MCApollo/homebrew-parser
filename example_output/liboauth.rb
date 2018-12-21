name :
	 Liboauth
homepage :
	 https://liboauth.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/liboauth/liboauth-1.0.3.tar.gz
description :
	 C library for the OAuth Core RFC 5849 standard
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-curl"
	 system "make", "install"
