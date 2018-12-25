name :
	 Jsonnet
homepage :
	 https://jsonnet.org/
url :
	 https://github.com/google/jsonnet/archive/v0.11.2.tar.gz
description :
	 Domain specific configuration language for defining JSON data
build_deps :
link_deps :
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "make"
	 bin.install "jsonnet"
