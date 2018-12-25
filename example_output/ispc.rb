name :
	 Ispc
homepage :
	 https://ispc.github.io
url :
	 https://github.com/ispc/ispc/archive/v1.9.2.tar.gz
description :
	 Compiler for SIMD programming on the CPU
build_deps :
	 bison
	 llvm@4
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "ispc"
