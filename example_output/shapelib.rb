name :
	 Shapelib
homepage :
	 http://shapelib.maptools.org/
url :
	 https://download.osgeo.org/shapelib/shapelib-1.4.1.tar.gz
description :
	 Library for reading and writing ArcView Shapefiles
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
