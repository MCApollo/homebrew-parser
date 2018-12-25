name :
	 Mpfi
homepage :
	 https://perso.ens-lyon.fr/nathalie.revol/software.html
url :
	 https://gforge.inria.fr/frs/download.php/file/37331/mpfi-1.5.3.tar.bz2
description :
	 Multiple precision interval arithmetic library
build_deps :
link_deps :
	 gmp
	 mpfr
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
