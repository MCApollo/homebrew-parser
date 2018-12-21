name :
	 RangeV3
homepage :
	 https://ericniebler.github.io/range-v3/
url :
	 https://github.com/ericniebler/range-v3/archive/0.4.0.tar.gz
description :
	 Experimental range library for C++11/14/17
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".",
	 "-DRANGE_V3_TESTS=OFF",
	 "-DRANGE_V3_HEADER_CHECKS=OFF",
	 "-DRANGE_V3_EXAMPLES=OFF",
	 "-DRANGE_V3_PERF=OFF",
	 *std_cmake_args
	 system "make", "install"
