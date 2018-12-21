name :
	 XmlrpcC
homepage :
	 https://xmlrpc-c.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/1.39.12/xmlrpc-c-1.39.12.tgz
description :
	 Lightweight RPC library (based on XML and HTTP)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--enable-libxml2-backend",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
