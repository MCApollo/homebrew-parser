name :
	 Yazpp
homepage :
	 https://www.indexdata.com/yazpp
url :
	 http://ftp.indexdata.dk/pub/yazpp/yazpp-1.6.5.tar.gz
description :
	 C++ API for the Yaz toolkit
build_deps :
link_deps :
	 yaz
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
