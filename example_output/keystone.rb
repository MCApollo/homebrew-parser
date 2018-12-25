name :
	 Keystone
homepage :
	 https://www.keystone-engine.org/
url :
	 https://github.com/keystone-engine/keystone/archive/0.9.1.tar.gz
description :
	 Assembler framework: Core + bindings
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
