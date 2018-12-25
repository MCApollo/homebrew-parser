name :
	 Flatbuffers
homepage :
	 https://google.github.io/flatbuffers
url :
	 https://github.com/google/flatbuffers/archive/v1.10.0.tar.gz
description :
	 Serialization library for C++, supporting Java, C#, and Go
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
	 system "cmake", "-G", "Unix Makefiles", *std_cmake_args
	 system "make", "install"
