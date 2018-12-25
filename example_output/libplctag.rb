name :
	 Libplctag
homepage :
	 https://github.com/kyle-github/libplctag
url :
	 https://github.com/kyle-github/libplctag/archive/v1.6.3.tar.gz
description :
	 Portable and simple API for accessing AB PLC data over Ethernet
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
