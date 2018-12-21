name :
	 Libzip
homepage :
	 https://libzip.org/
url :
	 https://libzip.org/download/libzip-1.5.1.tar.gz
description :
	 C library for reading, creating, and modifying zip archives
build_deps :
	 cmake
link_deps :
conflicts :
	 libtcod
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
