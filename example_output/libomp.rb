name :
	 Libomp
homepage :
	 https://openmp.llvm.org/
url :
	 https://releases.llvm.org/7.0.0/openmp-7.0.0.src.tar.xz
description :
	 LLVM's OpenMP runtime library
build_deps :
	 cmake
link_deps :
	 :macos
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
	 system "cmake", ".", "-DLIBOMP_ENABLE_SHARED=OFF", *std_cmake_args
	 system "make", "install"
