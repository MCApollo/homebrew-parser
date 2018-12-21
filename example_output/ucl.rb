name :
	 Ucl
homepage :
	 https://www.oberhumer.com/opensource/ucl/
url :
	 https://www.oberhumer.com/opensource/ucl/download/ucl-1.03.tar.gz
description :
	 Data compression library with small memory footprint
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
