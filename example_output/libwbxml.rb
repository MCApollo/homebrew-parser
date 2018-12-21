name :
	 Libwbxml
homepage :
	 https://sourceforge.net/projects/libwbxml/
url :
	 https://downloads.sourceforge.net/project/libwbxml/libwbxml/0.11.6/libwbxml-0.11.6.tar.bz2
description :
	 Library and tools to parse and encode WBXML documents
build_deps :
	 cmake
	 doxygen
	 graphviz
link_deps :
	 wget
conflicts :
patches :
EOF_patch :
install :
	 inreplace "cmake/CMakeLists.txt", "${CMAKE_ROOT}/Modules/",
	 "#{share}/cmake/Modules"
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args, "-DBUILD_DOCUMENTATION=ON"
	 system "make", "install"
