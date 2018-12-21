name :
	 SimpleAmqpClient
homepage :
	 https://github.com/alanxz/SimpleAmqpClient
url :
	 https://github.com/alanxz/SimpleAmqpClient/archive/v2.4.0.tar.gz
description :
	 C++ interface to rabbitmq-c
build_deps :
	 cmake
	 doxygen
link_deps :
	 boost
	 rabbitmq-c
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
