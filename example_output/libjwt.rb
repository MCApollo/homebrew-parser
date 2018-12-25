name :
	 Libjwt
homepage :
	 https://github.com/benmcollins/libjwt
url :
	 https://github.com/benmcollins/libjwt/archive/v1.10.0.tar.gz
description :
	 JSON Web Token C library
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 jansson
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "all"
	 system "make", "install"
