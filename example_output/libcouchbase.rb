name :
	 Libcouchbase
homepage :
	 https://docs.couchbase.com/c-sdk/2.10/start-using-sdk.html
url :
	 https://packages.couchbase.com/clients/c/libcouchbase-2.10.2.tar.gz
description :
	 C library for Couchbase
build_deps :
	 cmake
link_deps :
	 libev
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
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args,
	 "-DLCB_NO_TESTS=1",
	 "-DLCB_BUILD_LIBEVENT=ON",
	 "-DLCB_BUILD_LIBEV=ON",
	 "-DLCB_BUILD_LIBUV=ON"
	 system "make", "install"
	 end
