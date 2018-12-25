name :
	 Pazpar2
homepage :
	 https://www.indexdata.com/pazpar2
url :
	 http://ftp.indexdata.dk/pub/pazpar2/pazpar2-1.13.1.tar.gz
description :
	 Metasearching middleware webservice
build_deps :
	 pkg-config
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
	 system "./buildconf.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
