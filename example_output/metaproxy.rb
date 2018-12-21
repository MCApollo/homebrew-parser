name :
	 Metaproxy
homepage :
	 https://www.indexdata.com/metaproxy
url :
	 http://ftp.indexdata.dk/pub/metaproxy/metaproxy-1.15.0.tar.gz
description :
	 Z39.50 proxy and router utilizing Yaz toolkit
build_deps :
	 pkg-config
link_deps :
	 boost
	 yazpp
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
