name :
	 Fcrackzip
homepage :
	 http://oldhome.schmorp.de/marc/fcrackzip.html
url :
	 http://oldhome.schmorp.de/marc/data/fcrackzip-1.0.tar.gz
description :
	 Zip password cracker
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
	 system "make"
	 system "make", "install"
