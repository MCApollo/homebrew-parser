name :
	 Hayai
homepage :
	 https://bruun.co/2012/02/07/easy-cpp-benchmarking
url :
	 https://github.com/nickbruun/hayai/archive/v1.0.2.tar.gz
description :
	 C++ benchmarking framework inspired by the googletest framework
build_deps :
	 cmake
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
	 system "make", "install"
