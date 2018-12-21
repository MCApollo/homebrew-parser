name :
	 Sfcgal
homepage :
	 http://sfcgal.org/
url :
	 https://github.com/Oslandia/SFCGAL/archive/v1.3.6.tar.gz
description :
	 C++ wrapper library around CGAL
build_deps :
	 cmake
link_deps :
	 boost
	 cgal
	 gmp
	 mpfr
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
