name :
	 GoogleBenchmark
homepage :
	 https://github.com/google/benchmark
url :
	 https://github.com/google/benchmark/archive/v1.4.1.tar.gz
description :
	 C++ microbenchmark support library
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", "-DBENCHMARK_ENABLE_GTEST_TESTS=OFF", *std_cmake_args
	 system "make", "install"
