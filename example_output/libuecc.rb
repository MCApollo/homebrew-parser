name :
	 Libuecc
homepage :
	 https://git.universe-factory.net/libuecc/
url :
	 https://git.universe-factory.net/libuecc/snapshot/libuecc-7.tar
description :
	 Very small Elliptic Curve Cryptography library
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
