name :
	 Zebra
homepage :
	 https://www.indexdata.com/zebra
url :
	 http://ftp.indexdata.dk/pub/zebra/idzebra-2.1.4.tar.gz
description :
	 Information management system
build_deps :
link_deps :
	 icu4c
	 yaz
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-mod-text",
	 "--enable-mod-grs-regx",
	 "--enable-mod-grs-marc",
	 "--enable-mod-grs-xml",
	 "--enable-mod-dom",
	 "--enable-mod-alvis",
	 "--enable-mod-safari"
	 system "make", "install"
