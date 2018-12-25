name :
	 QpidProton
homepage :
	 https://qpid.apache.org/proton/
url :
	 https://www.apache.org/dyn/closer.lua?path=qpid/proton/0.24.0/qpid-proton-0.24.0.tar.gz
description :
	 High-performance, lightweight AMQP 1.0 messaging library
build_deps :
	 cmake
link_deps :
	 libuv
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DBUILD_BINDINGS=",
	 "-DLIB_INSTALL_DIR=#{lib}",
	 *std_cmake_args
	 system "make", "install"
