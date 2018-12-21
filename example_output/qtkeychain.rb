name :
	 Qtkeychain
homepage :
	 https://github.com/frankosterfeld/qtkeychain
url :
	 https://github.com/frankosterfeld/qtkeychain/archive/v0.9.1.tar.gz
description :
	 Platform-independent Qt API for storing passwords securely
build_deps :
	 cmake
link_deps :
	 qt
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DBUILD_TRANSLATIONS=OFF", *std_cmake_args
	 system "make", "install"
