name :
	 Libcapn
homepage :
	 http://libcapn.org/
url :
description :
	 C library to send push notifications to Apple devices
build_deps :
	 cmake
	 pkg-config
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 if build.stable?
	 (buildpath/"src/third_party/jansson").install resource("jansson")
	 end
	 system "cmake", ".", "-DOPENSSL_ROOT_DIR=#{Formula["openssl"].opt_prefix}",
	 *std_cmake_args
	 system "make", "install"
	 pkgshare.install "examples"
