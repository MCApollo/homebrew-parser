name :
	 Cquery
homepage :
	 https://github.com/cquery-project/cquery
url :
	 https://github.com/cquery-project/cquery.git
description :
	 C/C++ language server
build_deps :
	 cmake
link_deps :
	 llvm
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DSYSTEM_CLANG=ON", *std_cmake_args
	 system "make", "install"
