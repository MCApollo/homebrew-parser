name :
	 MklDnn
homepage :
	 https://01.org/mkl-dnn
url :
	 https://github.com/intel/mkl-dnn/archive/v0.17.1.tar.gz
description :
	 Intel Math Kernel Library for Deep Neural Networks
build_deps :
	 cmake
	 doxygen
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make"
	 system "make", "doc"
	 system "make", "install"
