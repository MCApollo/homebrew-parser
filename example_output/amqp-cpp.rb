name :
	 AmqpCpp
homepage :
	 https://github.com/CopernicaMarketingSoftware/AMQP-CPP
url :
	 https://github.com/CopernicaMarketingSoftware/AMQP-CPP/archive/v4.0.1.tar.gz
description :
	 C++ library for communicating with a RabbitMQ message broker
build_deps :
	 cmake
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", "-DBUILD_SHARED=ON",
	 "-DCMAKE_MACOSX_RPATH=1",
	 "-DAMQP-CPP_LINUX_TCP=ON",
	 *std_cmake_args
	 system "make"
	 system "make", "install"
