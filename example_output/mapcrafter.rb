name :
	 Mapcrafter
homepage :
	 https://mapcrafter.org
url :
	 https://github.com/mapcrafter/mapcrafter/archive/v.2.4.tar.gz
description :
	 Minecraft map renderer
build_deps :
	 cmake
link_deps :
	 boost
	 jpeg-turbo
	 libpng
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 args = std_cmake_args
	 args << "-DJPEG_INCLUDE_DIR=#{Formula["jpeg-turbo"].opt_include}"
	 args << "-DJPEG_LIBRARY=#{Formula["jpeg-turbo"].opt_lib}/libjpeg.dylib"
	 system "cmake", ".", *args
	 system "make", "install"
