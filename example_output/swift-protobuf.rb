name :
	 SwiftProtobuf
homepage :
	 https://github.com/apple/swift-protobuf
url :
	 https://github.com/apple/swift-protobuf/archive/1.2.0.tar.gz
description :
	 Plugin and runtime library for using protobuf with Swift
build_deps :
link_deps :
	 :xcode
	 protobuf
optional_deps :
conflicts :
	 protobuf-swift
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "swift", "build", "--disable-sandbox", "-c", "release", "-Xswiftc",
	 "-static-stdlib"
	 bin.install ".build/release/protoc-gen-swift"
	 doc.install "Documentation/PLUGIN.md"
