name :
	 Libwebsockets
homepage :
	 https://libwebsockets.org
url :
	 https://github.com/warmcat/libwebsockets/archive/v3.1.0.tar.gz
description :
	 C websockets server library
build_deps :
	 cmake
link_deps :
	 libevent
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
	 system "cmake", ".", *std_cmake_args,
	 "-DLWS_IPV6=ON",
	 "-DLWS_WITH_HTTP2=ON",
	 "-DLWS_WITH_LIBEVENT=ON",
	 "-DLWS_WITH_LIBUV=ON",
	 "-DLWS_WITH_PLUGINS=ON",
	 "-DLWS_WITHOUT_TESTAPPS=ON",
	 "-DLWS_UNIX_SOCK=ON"
	 system "make"
	 system "make", "install"
