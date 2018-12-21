name :
	 Librealsense
homepage :
	 https://github.com/IntelRealSense/librealsense
url :
	 https://github.com/IntelRealSense/librealsense/archive/v2.17.0.tar.gz
description :
	 Intel RealSense D400 series and SR300 capture
build_deps :
	 cmake
	 pkg-config
link_deps :
	 glfw
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DENABLE_CCACHE=OFF"
	 system "cmake", ".", "-DBUILD_WITH_OPENMP=OFF", *args
	 system "make", "install"
