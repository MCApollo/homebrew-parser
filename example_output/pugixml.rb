name :
	 Pugixml
homepage :
	 https://pugixml.org/
url :
	 https://github.com/zeux/pugixml/releases/download/v1.9/pugixml-1.9.tar.gz
description :
	 Light-weight C++ XML processing library
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DBUILD_SHARED_LIBS=OFF",
	 "-DBUILD_PKGCONFIG=ON", *std_cmake_args
	 system "make", "install"
