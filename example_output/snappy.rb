name :
	 Snappy
homepage :
	 https://google.github.io/snappy/
url :
	 https://github.com/google/snappy/archive/1.1.7.tar.gz
description :
	 Compression/decompression library aiming for high speed
build_deps :
	 cmake
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/google/snappy/pull/61.patch?full_index=1
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 system "make", "clean"
	 system "cmake", ".", "-DBUILD_SHARED_LIBS=ON", *std_cmake_args
	 system "make", "install"
