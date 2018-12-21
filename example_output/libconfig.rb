name :
	 Libconfig
homepage :
	 https://hyperrealm.github.io/libconfig/
url :
	 https://github.com/hyperrealm/libconfig/archive/v1.7.2.tar.gz
description :
	 Configuration file processing library
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
