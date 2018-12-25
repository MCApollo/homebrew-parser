name :
	 ProtobufSwift
homepage :
	 https://github.com/alexeyxo/protobuf-swift
url :
	 https://github.com/alexeyxo/protobuf-swift/archive/4.0.6.tar.gz
description :
	 Implementation of Protocol Buffers in Swift
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 protobuf
optional_deps :
conflicts :
	 swift-protobuf
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "protoc", "-Iplugin/compiler",
	 "plugin/compiler/google/protobuf/descriptor.proto",
	 "plugin/compiler/google/protobuf/swift-descriptor.proto",
	 "--cpp_out=plugin/compiler"
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
