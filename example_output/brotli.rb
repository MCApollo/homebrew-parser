name :
	 Brotli
homepage :
	 https://github.com/google/brotli
url :
	 https://github.com/google/brotli/archive/v1.0.7.tar.gz
description :
	 Generic-purpose lossless compression algorithm by Google
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
	 system "make", "VERBOSE=1"
	 system "ctest", "-V"
	 system "make", "install"
