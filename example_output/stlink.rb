name :
	 Stlink
homepage :
	 https://github.com/texane/stlink
url :
	 https://github.com/texane/stlink/archive/v1.5.1.tar.gz
description :
	 STM32 discovery line Linux programmer
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
	 system "make", "install"
