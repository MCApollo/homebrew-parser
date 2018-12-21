name :
	 Libuv
homepage :
	 https://github.com/libuv/libuv
url :
	 https://github.com/libuv/libuv/archive/v1.24.1.tar.gz
description :
	 Multi-platform support library with a focus on asynchronous I/O
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
	 sphinx-doc
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "docs" do
	 system "make", "man"
	 system "make", "singlehtml"
	 man1.install "build/man/libuv.1"
	 doc.install Dir["build/singlehtml/*"]
