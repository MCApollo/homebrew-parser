name :
	 Globjects
homepage :
	 https://github.com/cginternals/globjects
url :
	 https://github.com/cginternals/globjects/archive/v1.1.0.tar.gz
description :
	 C++ library strictly wrapping OpenGL objects
build_deps :
	 cmake
link_deps :
	 glbinding
	 glm
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", ".", "-Dglbinding_DIR=#{Formula["glbinding"].opt_prefix}", *std_cmake_args
	 system "cmake", "--build", ".", "--target", "install"
