name :
	 Glslang
homepage :
	 https://www.khronos.org/opengles/sdk/tools/Reference-Compiler/
url :
	 https://github.com/KhronosGroup/glslang/archive/7.10.2984.tar.gz
description :
	 OpenGL and OpenGL ES reference compiler for shading languages
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
	 system "make", "install"
