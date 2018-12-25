name :
	 Sipcalc
homepage :
	 http://www.routemeister.net/projects/sipcalc/
url :
	 http://www.routemeister.net/projects/sipcalc/files/sipcalc-1.1.6.tar.gz
description :
	 Advanced console-based IP subnet calculator
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
