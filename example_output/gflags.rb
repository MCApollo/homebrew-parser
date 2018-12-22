name :
	 Gflags
homepage :
	 https://gflags.github.io/gflags/
url :
	 https://github.com/gflags/gflags/archive/v2.2.2.tar.gz
description :
	 Library for processing command-line flags
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 if build.with? "static"
	 args << "-DBUILD_SHARED_LIBS=OFF"
	 else
	 args << "-DBUILD_SHARED_LIBS=ON"