name :
	 Libuvc
homepage :
	 https://github.com/ktossell/libuvc
url :
	 https://github.com/ktossell/libuvc/archive/v0.0.6.tar.gz
description :
	 Cross-platform library for USB video devices
build_deps :
	 cmake
	 pkg-config
link_deps :
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make"
	 system "make", "install"
