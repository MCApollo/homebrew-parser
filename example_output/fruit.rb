name :
	 Fruit
homepage :
	 https://github.com/google/fruit/wiki
url :
	 https://github.com/google/fruit/archive/v3.4.0.tar.gz
description :
	 Dependency injection framework for C++
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DFRUIT_USES_BOOST=False", *std_cmake_args
	 system "make", "install"
	 pkgshare.install "examples/hello_world/main.cpp"
