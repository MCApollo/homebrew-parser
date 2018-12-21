name :
	 LibjsonRpcCpp
homepage :
	 https://github.com/cinemast/libjson-rpc-cpp
url :
	 https://github.com/cinemast/libjson-rpc-cpp/archive/v1.1.1.tar.gz
description :
	 C++ framework for json-rpc
build_deps :
	 cmake
link_deps :
	 argtable
	 hiredis
	 jsoncpp
	 libmicrohttpd
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make"
	 system "make", "install"
