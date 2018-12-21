name :
	 Monero
homepage :
	 https://getmonero.org/
url :
	 https://github.com/monero-project/monero.git
description :
	 Official monero wallet and cpu miner
build_deps :
	 cmake
	 pkg-config
link_deps :
	 boost
	 libsodium
	 openssl
	 readline
	 unbound
	 zeromq
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"cppzmq").install resource("cppzmq")
	 system "cmake", ".", "-DZMQ_INCLUDE_PATH=#{buildpath}/cppzmq",
	 "-DReadline_ROOT_DIR=#{Formula["readline"].opt_prefix}",
	 *std_cmake_args
	 system "make", "install"
	 rm lib/"libminiupnpc.a"
	 rm_rf include/"miniupnpc"
