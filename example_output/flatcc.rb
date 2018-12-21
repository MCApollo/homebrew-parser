name :
	 Flatcc
homepage :
	 https://github.com/dvidelabs/flatcc
url :
	 https://github.com/dvidelabs/flatcc/archive/v0.5.2.tar.gz
description :
	 FlatBuffers Compiler and Library in C for C
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", "-G", "Unix Makefiles", buildpath, *std_cmake_args
	 system "make"
	 bin.install "bin/flatcc"
	 lib.install "lib/libflatcc.a"
	 lib.install "lib/libflatccrt.a"
	 include.install Dir["include/*"]
