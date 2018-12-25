name :
	 Lzo
homepage :
	 https://www.oberhumer.com/opensource/lzo/
url :
	 https://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz
description :
	 Real-time data compression library
build_deps :
link_deps :
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
	 "--enable-shared"
	 system "make"
	 system "make", "check"
	 system "make", "install"
