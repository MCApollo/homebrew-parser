name :
	 Glbinding
homepage :
	 https://github.com/cginternals/glbinding
url :
	 https://github.com/cginternals/glbinding/archive/v2.1.4.tar.gz
description :
	 C++ binding for the OpenGL API
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
	 ENV.cxx11
	 system "cmake", ".", *std_cmake_args, "-DGLFW_LIBRARY_RELEASE="
	 system "cmake", "--build", ".", "--target", "install"
