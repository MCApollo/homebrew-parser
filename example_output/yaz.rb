name :
	 Yaz
homepage :
	 https://www.indexdata.com/yaz
url :
	 http://ftp.indexdata.dk/pub/yaz/yaz-5.27.0.tar.gz
description :
	 Toolkit for Z39.50/SRW/SRU clients/servers
build_deps :
	 pkg-config
link_deps :
	 icu4c
conflicts :
patches :
EOF_patch :
install :
	 system "./buildconf.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-xml2"
	 system "make", "install"
