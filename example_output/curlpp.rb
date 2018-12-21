name :
	 Curlpp
homepage :
	 https://www.curlpp.org/
url :
	 https://github.com/jpbarrette/curlpp/archive/v0.8.1.tar.gz
description :
	 C++ wrapper for libcURL
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
