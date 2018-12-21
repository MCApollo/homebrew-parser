name :
	 Libcds
homepage :
	 https://libcds.sourceforge.io/doc/cds-api/index.html
url :
	 https://github.com/khizmax/libcds/archive/v2.3.2.tar.gz
description :
	 C++ library of Concurrent Data Structures
build_deps :
	 cmake
link_deps :
	 boost
	 gcc
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
