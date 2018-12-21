name :
	 Libiscsi
homepage :
	 https://github.com/sahlberg/libiscsi
url :
	 https://sites.google.com/site/libiscsitarballs/libiscsitarballs/libiscsi-1.18.0.tar.gz
description :
	 Client library and utilities for iscsi
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 cunit
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
