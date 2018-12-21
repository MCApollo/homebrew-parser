name :
	 YamlCpp
homepage :
	 https://github.com/jbeder/yaml-cpp
url :
	 https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-0.6.2.tar.gz
description :
	 C++ YAML parser and emitter for YAML 1.2 spec
build_deps :
	 cmake
link_deps :
conflicts :
patches :
	 https://github.com/jbeder/yaml-cpp/commit/5e79f5eed3d86125468681116e92814d2cf40067.patch?full_index=1
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args, "-DBUILD_SHARED_LIBS=ON"
	 system "make", "install"
