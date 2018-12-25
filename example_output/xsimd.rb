name :
	 Xsimd
homepage :
	 https://xsimd.readthedocs.io/en/latest/
url :
	 https://github.com/QuantStack/xsimd/archive/7.1.1.tar.gz
description :
	 Modern, portable C++ wrappers for SIMD intrinsics
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
	 args = std_cmake_args
	 args << "-DBUILD_TESTS=OFF"
	 system "cmake", ".", *args
	 system "make", "install"
