name :
	 Foma
homepage :
	 https://code.google.com/p/foma/
url :
	 https://bitbucket.org/mhulden/foma/downloads/foma-0.9.18.tar.gz
description :
	 Finite-state compiler and C library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "prefix=#{prefix}"
