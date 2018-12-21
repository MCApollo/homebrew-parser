name :
	 Glfw
homepage :
	 https://www.glfw.org/
url :
	 https://github.com/glfw/glfw/archive/3.2.1.tar.gz
description :
	 Multi-platform library for OpenGL applications
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %w[
	 -DGLFW_USE_CHDIR=TRUE
	 -DGLFW_USE_MENUBAR=TRUE
	 ]
	 args << "-DBUILD_SHARED_LIBS=TRUE" if build.with? "shared-library"
	 system "cmake", *args, "."
	 system "make", "install"
