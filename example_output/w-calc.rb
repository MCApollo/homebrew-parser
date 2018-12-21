name :
	 WCalc
homepage :
	 https://w-calc.sourceforge.io/
url :
	 https://downloads.sourceforge.net/w-calc/wcalc-2.5.tar.bz2
description :
	 Very capable calculator
build_deps :
link_deps :
	 gmp
	 mpfr
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
