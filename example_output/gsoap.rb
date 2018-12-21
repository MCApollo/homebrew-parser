name :
	 Gsoap
homepage :
	 https://www.genivia.com/products.html
url :
	 https://downloads.sourceforge.net/project/gsoap2/gsoap-2.8/gsoap_2.8.70.zip
description :
	 SOAP stub and skeleton compiler for C and C++
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
