name :
	 Snappystream
homepage :
	 https://github.com/hoxnox/snappystream
url :
	 https://github.com/hoxnox/snappystream/archive/1.0.0.tar.gz
description :
	 C++ snappy stream realization (compatible with snappy)
build_deps :
	 cmake
link_deps :
	 snappy
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args, "-DBUILD_TESTS=ON"
	 system "make", "all", "test", "install"
