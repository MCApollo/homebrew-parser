name :
	 Libswiftnav
homepage :
	 https://github.com/swift-nav/libswiftnav-legacy
url :
	 https://github.com/swift-nav/libswiftnav-legacy/archive/v0.21.tar.gz
description :
	 C library implementing GNSS related functions and algorithms
build_deps :
	 cmake
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
