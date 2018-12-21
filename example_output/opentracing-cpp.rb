name :
	 OpentracingCpp
homepage :
	 https://opentracing.io/
url :
	 https://github.com/opentracing/opentracing-cpp/archive/v1.5.0.tar.gz
description :
	 OpenTracing API for C++
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 pkgshare.install "example/tutorial/tutorial-example.cpp"
	 pkgshare.install "example/tutorial/text_map_carrier.h"
