name :
	 Ubertooth
homepage :
	 https://github.com/greatscottgadgets/ubertooth/wiki
url :
	 https://github.com/greatscottgadgets/ubertooth/releases/download/2018-12-R1/ubertooth-2018-12-R1.tar.xz
description :
	 Host tools for Project Ubertooth
build_deps :
	 cmake
	 pkg-config
link_deps :
	 libbtbb
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 mkdir "host/build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
