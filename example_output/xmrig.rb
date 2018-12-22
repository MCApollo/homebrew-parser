name :
	 Xmrig
homepage :
	 https://github.com/xmrig/xmrig
url :
	 https://github.com/xmrig/xmrig/archive/v2.8.3.tar.gz
description :
	 Monero (XMR) CPU miner
build_deps :
	 cmake
link_deps :
	 libmicrohttpd
	 libuv
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DUV_LIBRARY=#{Formula["libuv"].opt_lib}/libuv.dylib",
	 *std_cmake_args
	 system "make"
	 bin.install "xmrig"
	 end
	 pkgshare.install "src/config.json"
