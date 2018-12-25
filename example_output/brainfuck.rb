name :
	 Brainfuck
homepage :
	 https://github.com/fabianishere/brainfuck
url :
	 https://github.com/fabianishere/brainfuck/archive/2.7.1.tar.gz
description :
	 Interpreter for the brainfuck language
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
	 system "cmake", ".", *std_cmake_args, "-DBUILD_SHARED_LIB=ON",
	 "-DBUILD_STATIC_LIB=ON", "-DINSTALL_EXAMPLES=ON"
	 system "make", "install"
