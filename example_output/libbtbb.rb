name :
	 Libbtbb
homepage :
	 https://github.com/greatscottgadgets/libbtbb
url :
	 https://github.com/greatscottgadgets/libbtbb/archive/2018-12-R1.tar.gz
description :
	 Bluetooth baseband decoding library
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
