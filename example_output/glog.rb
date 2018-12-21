name :
	 Glog
homepage :
	 https://github.com/google/glog
url :
	 https://github.com/google/glog/archive/v0.3.5.tar.gz
description :
	 Application-level logging library
build_deps :
	 cmake
link_deps :
	 gflags
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DBUILD_SHARED_LIBS=ON", *std_cmake_args
	 system "make", "install"
