name :
	 Libftdi
homepage :
	 https://www.intra2net.com/en/developer/libftdi
url :
	 https://www.intra2net.com/en/developer/libftdi/download/libftdi1-1.4.tar.bz2
description :
	 Library to talk to FTDI chips
build_deps :
	 cmake
	 pkg-config
	 swig
link_deps :
	 libusb
	 boost
	 confuse
conflicts :
patches :
EOF_patch :
install :
	 mkdir "libftdi-build" do
	 system "cmake", "..", "-DPYTHON_BINDINGS=OFF", *std_cmake_args
	 system "make", "install"
	 (libexec/"bin").install "examples/find_all"
