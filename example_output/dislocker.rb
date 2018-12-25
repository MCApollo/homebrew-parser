name :
	 Dislocker
homepage :
	 https://github.com/Aorimn/dislocker
url :
	 https://github.com/Aorimn/dislocker/archive/v0.7.1.tar.gz
description :
	 FUSE driver to read/write Windows' BitLocker-ed volumes
build_deps :
	 cmake
link_deps :
	 mbedtls
	 :osxfuse
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", "-DCMAKE_DISABLE_FIND_PACKAGE_Ruby=TRUE", *std_cmake_args
	 system "make"
	 system "make", "install"
