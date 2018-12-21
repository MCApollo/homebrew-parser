name :
	 Cnats
homepage :
	 https://github.com/nats-io/cnats
url :
	 https://github.com/nats-io/cnats/archive/v1.8.0.tar.gz
description :
	 C client for the NATS messaging system
build_deps :
	 cmake
link_deps :
	 libevent
	 libuv
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DNATS_INSTALL_PREFIX=#{prefix}",
	 "-DBUILD_TESTING=OFF", *std_cmake_args
	 system "make", "install"
