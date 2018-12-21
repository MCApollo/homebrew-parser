name :
	 Ntopng
homepage :
	 https://www.ntop.org/products/traffic-analysis/ntop/
url :
	 https://github.com/ntop/ntopng/archive/3.6.1.tar.gz
description :
	 Next generation version of the original ntop
build_deps :
	 autoconf
	 automake
	 gnutls
	 json-glib
	 libtool
	 pkg-config
	 zeromq
link_deps :
	 geoip
	 json-c
	 libmaxminddb
	 lua
	 mysql-client
	 redis
	 rrdtool
conflicts :
patches :
EOF_patch :
install :
	 resource("nDPI").stage do
	 system "./autogen.sh"
	 system "make"
	 (buildpath/"nDPI").install Dir["*"]
