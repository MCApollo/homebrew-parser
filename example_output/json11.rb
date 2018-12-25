name :
	 Json11
homepage :
	 https://github.com/dropbox/json11
url :
	 https://github.com/dropbox/json11/archive/v1.0.0.tar.gz
description :
	 Tiny JSON library for C++11
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
