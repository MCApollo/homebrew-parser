name :
	 Libbladerf
homepage :
	 https://nuand.com/
url :
	 https://github.com/Nuand/bladeRF/archive/2018.08.tar.gz
description :
	 USB 3.0 Superspeed Software Defined Radio Source
build_deps :
	 cmake
	 pkg-config
link_deps :
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend "CFLAGS", "-I#{MacOS.sdk_path}/usr/include/malloc"
	 mkdir "host/build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
