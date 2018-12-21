name :
	 Libcue
homepage :
	 https://github.com/lipnitsk/libcue
url :
	 https://github.com/lipnitsk/libcue/archive/v2.2.1.tar.gz
description :
	 Cue sheet parser library for C
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DBUILD_SHARED_LIBS=ON", *std_cmake_args
	 system "make", "install"
	 (pkgshare/"tests").install Dir["t/*"]
