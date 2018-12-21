name :
	 Libxc
homepage :
	 http://www.tddft.org/programs/libxc/
url :
	 http://www.tddft.org/programs/octopus/down.php?file=libxc/3.0.1/libxc-3.0.1.tar.gz
description :
	 Library of exchange and correlation functionals for codes
build_deps :
link_deps :
	 gcc
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-shared",
	 "FCCPP=gfortran -E -x c",
	 "CC=#{ENV.cc}"
	 system "make", "install"
