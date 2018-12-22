name :
	 Libfreenect
homepage :
	 https://openkinect.org/
url :
	 https://github.com/OpenKinect/libfreenect/archive/v0.5.7.tar.gz
description :
	 Drivers and libraries for the Xbox Kinect device
build_deps :
	 cmake
link_deps :
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args,
	 "-DBUILD_OPENNI2_DRIVER=ON"
	 system "make", "install"
	 end
