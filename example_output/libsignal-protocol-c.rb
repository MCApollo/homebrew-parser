name :
	 LibsignalProtocolC
homepage :
	 https://github.com/signalapp/libsignal-protocol-c
url :
	 https://github.com/signalapp/libsignal-protocol-c/archive/v2.3.2.tar.gz
description :
	 Signal Protocol C Library
build_deps :
	 cmake
	 pkg-config
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DBUILD_SHARED_LIBS=ON", *std_cmake_args
	 system "make", "install"
