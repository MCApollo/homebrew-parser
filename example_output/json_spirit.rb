name :
	 JsonSpirit
homepage :
	 https://www.codeproject.com/Articles/20027/JSON-Spirit-A-C-JSON-Parser-Generator-Implemented
url :
	 https://github.com/png85/json_spirit/archive/json_spirit-4.07.tar.gz
description :
	 C++ JSON parser/generator
build_deps :
	 cmake
link_deps :
	 boost
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DBUILD_STATIC_LIBRARIES=ON"
	 system "cmake", *args
	 system "make"
	 args = std_cmake_args
	 args << "-DBUILD_STATIC_LIBRARIES=OFF"
	 system "cmake", *args
	 system "make", "install"
