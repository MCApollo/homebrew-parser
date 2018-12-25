name :
	 Rapidjson
homepage :
	 https://miloyip.github.io/rapidjson/
url :
	 https://github.com/miloyip/rapidjson/archive/v1.1.0.tar.gz
description :
	 JSON parser/generator for C++ with SAX and DOM style APIs
build_deps :
	 cmake
	 doxygen
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
	 system "make", "install"
