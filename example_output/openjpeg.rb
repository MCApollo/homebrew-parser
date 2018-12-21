name :
	 Openjpeg
homepage :
	 https://www.openjpeg.org/
url :
	 https://github.com/uclouvain/openjpeg/archive/v2.3.0.tar.gz
description :
	 Library for JPEG-2000 image manipulation
build_deps :
	 cmake
	 doxygen
link_deps :
	 libpng
	 libtiff
	 little-cms2
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DBUILD_SHARED_LIBS=OFF" if build.with? "static"
	 args << "-DBUILD_DOC=ON"
	 system "cmake", ".", *args
	 system "make", "install"
