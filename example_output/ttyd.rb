name :
	 Ttyd
homepage :
	 https://github.com/tsl0922/ttyd
url :
	 https://github.com/tsl0922/ttyd/archive/1.4.2.tar.gz
description :
	 Command-line tool for sharing terminal over the web
build_deps :
	 cmake
	 pkg-config
link_deps :
	 json-c
	 libwebsockets
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cmake_args = std_cmake_args + ["-DOPENSSL_ROOT_DIR=#{Formula["openssl"].opt_prefix}"]
	 system "cmake", ".", *cmake_args
	 system "make", "install"
