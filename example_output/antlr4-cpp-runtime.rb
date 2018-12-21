name :
	 Antlr4CppRuntime
homepage :
	 https://www.antlr.org/
url :
	 https://www.antlr.org/download/antlr4-cpp-runtime-4.7.1-source.zip
description :
	 ANother Tool for Language Recognition C++ Runtime Library
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
