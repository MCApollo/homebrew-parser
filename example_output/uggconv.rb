name :
	 Uggconv
homepage :
	 https://wyrmcorp.com/software/uggconv/index.shtml
url :
	 https://wyrmcorp.com/software/uggconv/uggconv-1.0.tar.gz
description :
	 Universal Game Genie code convertor
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
	 system "make"
	 bin.install "uggconv"
	 man1.install "uggconv.1"
