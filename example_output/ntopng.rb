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
optional_deps :
conflicts :
resource :
	 ['nDPI']
	 ['https://github.com/ntop/nDPI/archive/2.4.tar.gz']
patches :
EOF_patch :
install :
	 resource("nDPI").stage do
	 system "./autogen.sh"
	 system "make"
	 (buildpath/"nDPI").install Dir["*"]
	 end
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
