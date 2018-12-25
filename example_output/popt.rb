name :
	 Popt
homepage :
	 http://rpm5.org
url :
	 http://rpm5.org/files/popt/popt-1.16.tar.gz
description :
	 Library like getopt(3) with a number of enhancements
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
