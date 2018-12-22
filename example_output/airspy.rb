name :
	 Airspy
homepage :
	 https://airspy.com/
url :
	 https://github.com/airspy/airspyone_host/archive/v1.0.9.tar.gz
description :
	 The usemode driver and associated tools for airspy
build_deps :
	 cmake
	 pkg-config
link_deps :
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 libusb = Formula["libusb"]
	 args << "-DLIBUSB_INCLUDE_DIR=#{libusb.opt_include}/libusb-1.0"
	 args << "-DLIBUSB_LIBRARIES=#{libusb.opt_lib}/libusb-1.0.dylib"
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make", "install"
	 end
