name :
	 Msgpuck
homepage :
	 https://rtsisyk.github.io/msgpuck/
url :
	 https://github.com/rtsisyk/msgpuck/archive/2.0.tar.gz
description :
	 A simple and efficient MsgPack binary serialization library
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
