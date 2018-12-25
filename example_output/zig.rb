name :
	 Zig
homepage :
	 https://ziglang.org/
url :
	 https://github.com/ziglang/zig/archive/0.3.0.tar.gz
description :
	 Programming language designed for robustness, optimality, and clarity
build_deps :
	 cmake
link_deps :
	 llvm
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
