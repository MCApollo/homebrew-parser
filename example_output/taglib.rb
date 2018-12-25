name :
	 Taglib
homepage :
	 https://taglib.github.io/
url :
	 https://taglib.github.io/releases/taglib-1.11.1.tar.gz
description :
	 Audio metadata library
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
	 system "cmake", "-DWITH_MP4=ON", "-DWITH_ASF=ON", "-DBUILD_SHARED_LIBS=ON",
	 *std_cmake_args
	 system "make", "install"
