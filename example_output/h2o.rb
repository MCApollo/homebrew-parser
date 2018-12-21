name :
	 H2o
homepage :
	 https://github.com/h2o/h2o/
url :
	 https://github.com/h2o/h2o/archive/v2.2.5.tar.gz
description :
	 HTTP server with support for HTTP/1.x and HTTP/2
build_deps :
	 cmake
	 pkg-config
link_deps :
	 openssl
	 libuv
	 wslay
conflicts :
patches :
EOF_patch :
install :
	 ENV.delete("SDKROOT")
	 args = std_cmake_args
	 args << "-DWITH_BUNDLED_SSL=OFF"
	 args << "-DOPENSSL_ROOT_DIR=#{Formula["openssl"].opt_prefix}"
	 args << "-DWITH_MRUBY=OFF" if build.without? "mruby"
	 system "cmake", *args
	 if build.with? "libuv"
	 system "make", "libh2o"
	 lib.install "libh2o.a"
