name :
	 Hana
homepage :
	 https://github.com/boostorg/hana
url :
	 https://github.com/boostorg/hana/archive/v1.5.0.tar.gz
description :
	 The Boost.Hana C++14 metaprogramming library
build_deps :
	 cmake
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
