name :
	 Pagmo
homepage :
	 https://esa.github.io/pagmo2/
url :
	 https://github.com/esa/pagmo2/archive/v2.9.tar.gz
description :
	 Scientific library for massively parallel optimization
build_deps :
	 cmake
link_deps :
	 boost
	 eigen
	 nlopt
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", ".", "-DPAGMO_WITH_EIGEN3=ON", "-DPAGMO_WITH_NLOPT=ON",
	 *std_cmake_args
	 system "make", "install"
