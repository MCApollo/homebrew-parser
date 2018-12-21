name :
	 Msgpack
homepage :
	 https://msgpack.org/
url :
	 https://github.com/msgpack/msgpack-c/releases/download/cpp-3.1.1/msgpack-3.1.1.tar.gz
description :
	 Library for a binary-based efficient data interchange format
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
