name :
	 Libcec
homepage :
	 http://libcec.pulse-eight.com/
url :
	 https://github.com/Pulse-Eight/libcec/archive/libcec-4.0.3.tar.gz
description :
	 Control devices with TV remote control and HDMI cabling
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 ['p8-platform']
	 ['https://github.com/Pulse-Eight/platform/archive/p8-platform-2.1.0.1.tar.gz']
patches :
EOF_patch :
install :
	 ENV.cxx11
	 resource("p8-platform").stage do
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make"
	 system "make", "install"
	 end
	 end
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make"
	 system "make", "install"
	 end
