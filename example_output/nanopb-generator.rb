name :
	 NanopbGenerator
homepage :
	 https://jpa.kapsi.fi/nanopb/docs/index.html
url :
	 https://jpa.kapsi.fi/nanopb/download/nanopb-0.3.9.1.tar.gz
description :
	 C library for encoding and decoding Protocol Buffer messages
build_deps :
link_deps :
	 protobuf
	 python@2
conflicts :
	 mesos
patches :
EOF_patch :
install :
	 cd "generator" do
	 system "make", "-C", "proto"
	 inreplace "nanopb_generator.py", %r{^#!/usr/bin/env python$},
	 "#!/usr/bin/python"
	 libexec.install "nanopb_generator.py", "protoc-gen-nanopb", "proto"
	 bin.install_symlink libexec/"protoc-gen-nanopb", libexec/"nanopb_generator.py"
	 end
