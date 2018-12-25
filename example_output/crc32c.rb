name :
	 Crc32c
homepage :
	 https://github.com/google/crc32c
url :
	 https://github.com/google/crc32c/archive/1.0.6.tar.gz
description :
	 CRC32C implementation with CPU-specific acceleration
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
	 system "cmake", ".", "-DCRC32C_BUILD_TESTS=0", "-DCRC32C_BUILD_BENCHMARKS=0", "-DCRC32C_USE_GLOG=0", *std_cmake_args
	 system "make", "install"
	 system "make", "clean"
	 system "cmake", ".", "-DBUILD_SHARED_LIBS=ON", "-DCRC32C_BUILD_TESTS=0", "-DCRC32C_BUILD_BENCHMARKS=0", "-DCRC32C_USE_GLOG=0", *std_cmake_args
	 system "make", "install"
