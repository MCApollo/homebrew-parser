name :
	 ProtobufC
homepage :
	 https://github.com/protobuf-c/protobuf-c
url :
	 https://github.com/protobuf-c/protobuf-c/releases/download/v1.3.1/protobuf-c-1.3.1.tar.gz
description :
	 Protocol buffers library
build_deps :
	 pkg-config
link_deps :
	 protobuf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
