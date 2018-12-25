name :
	 Clblas
homepage :
	 https://github.com/clMathLibraries/clBLAS
url :
	 https://github.com/clMathLibraries/clBLAS/archive/v2.12.tar.gz
description :
	 Library containing BLAS functions written in OpenCL
build_deps :
	 boost
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
	 system "cmake", "src", *std_cmake_args,
	 "-DBUILD_CLIENT=OFF",
	 "-DBUILD_KTEST=OFF",
	 "-DBUILD_TEST=OFF",
	 "-DCMAKE_MACOSX_RPATH:BOOL=ON",
	 "-DSUFFIX_LIB:STRING="
	 system "make", "install"
	 pkgshare.install "src/samples/example_srot.c"
