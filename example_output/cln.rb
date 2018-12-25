name :
	 Cln
homepage :
	 https://www.ginac.de/CLN/
url :
	 https://www.ginac.de/CLN/cln-1.3.4.tar.bz2
description :
	 Class Library for Numbers
build_deps :
link_deps :
	 gmp
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking"
	 system "make"
	 system "make", "check"
	 system "make", "install"
