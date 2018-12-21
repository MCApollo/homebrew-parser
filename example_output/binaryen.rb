name :
	 Binaryen
homepage :
	 https://webassembly.org/
url :
	 https://github.com/WebAssembly/binaryen/archive/version_61.tar.gz
description :
	 Compiler infrastructure and toolchain library for WebAssembly
build_deps :
	 cmake
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 pkgshare.install "test/"
