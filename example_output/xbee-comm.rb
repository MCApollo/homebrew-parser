name :
	 XbeeComm
homepage :
	 https://github.com/guyzmo/xbee-comm.git
url :
	 https://github.com/guyzmo/xbee-comm/archive/v1.5.tar.gz
description :
	 XBee communication libraries and utilities
build_deps :
	 autoconf
	 automake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "aclocal"
	 system "autoconf"
	 system "autoheader"
	 system "automake", "-a", "-c"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
