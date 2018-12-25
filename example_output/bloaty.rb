name :
	 Bloaty
homepage :
	 https://github.com/google/bloaty
url :
	 https://github.com/google/bloaty/releases/download/v1.0/bloaty-1.0.tar.bz2
description :
	 Size profiler for binaries
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
	 system "make"
	 bin.install buildpath/"bloaty"
