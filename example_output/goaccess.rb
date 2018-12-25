name :
	 Goaccess
homepage :
	 https://goaccess.io/
url :
	 https://tar.goaccess.io/goaccess-1.2.tar.gz
description :
	 Log analyzer and interactive viewer for the Apache Webserver
build_deps :
	 autoconf
	 automake
link_deps :
	 libmaxminddb
	 tokyo-cabinet
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-vfi"
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --enable-utf8
	 --enable-tcb=btree
	 --enable-geoip=mmdb
	 ]
	 system "./configure", *args
	 system "make", "install"
