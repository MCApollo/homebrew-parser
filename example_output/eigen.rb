name :
	 Eigen
homepage :
	 https://eigen.tuxfamily.org/
url :
	 https://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2
description :
	 C++ template library for linear algebra
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "eigen-build" do
	 args = std_cmake_args
	 args << "-Dpkg_config_libdir=#{lib}" << ".."
	 system "cmake", *args
	 system "make", "install"
