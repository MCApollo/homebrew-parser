name :
	 Cpprestsdk
homepage :
	 https://github.com/Microsoft/cpprestsdk
url :
	 https://github.com/Microsoft/cpprestsdk.git
description :
	 C++ libraries for cloud-based client-server communication
build_deps :
	 cmake
link_deps :
	 boost
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", "-DBUILD_SAMPLES=OFF", "-DBUILD_TESTS=OFF", "Release", *std_cmake_args
	 system "make", "install"
