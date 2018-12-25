name :
	 RabbitmqC
homepage :
	 https://github.com/alanxz/rabbitmq-c
url :
	 https://github.com/alanxz/rabbitmq-c/archive/v0.9.0.tar.gz
description :
	 RabbitMQ C client
build_deps :
	 cmake
	 pkg-config
link_deps :
	 openssl
	 popt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args, "-DBUILD_EXAMPLES=OFF",
	 "-DBUILD_TESTS=OFF", "-DBUILD_API_DOCS=OFF",
	 "-DBUILD_TOOLS=ON"
	 system "make", "install"
