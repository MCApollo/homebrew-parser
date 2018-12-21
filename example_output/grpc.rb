name :
	 Grpc
homepage :
	 https://www.grpc.io/
url :
	 https://github.com/grpc/grpc/archive/v1.17.2.tar.gz
description :
	 Next generation open source RPC library and framework
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 c-ares
	 gflags
	 openssl
	 protobuf
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "prefix=#{prefix}"
	 system "make", "install-plugins", "prefix=#{prefix}"
	 (buildpath/"third_party/googletest").install resource("gtest")
	 system "make", "grpc_cli", "prefix=#{prefix}"
	 bin.install "bins/opt/grpc_cli"
