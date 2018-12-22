name :
	 Vrpn
homepage :
	 https://github.com/vrpn/vrpn/wiki
url :
	 https://github.com/vrpn/vrpn/releases/download/version_07.34/vrpn_07.34.zip
description :
	 Virtual reality peripheral network
build_deps :
	 cmake
link_deps :
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 ENV.libstdcxx unless MacOS.version > :mavericks
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args,
	 "-DCMAKE_OSX_SYSROOT=#{MacOS.sdk_path}",
	 "-DVRPN_BUILD_CLIENTS:BOOL=OFF",
	 "-DVRPN_BUILD_JAVA:BOOL=OFF"
	 system "make", "install"
	 end
