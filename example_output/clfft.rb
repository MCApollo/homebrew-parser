name :
	 Clfft
homepage :
	 https://github.com/clMathLibraries/clFFT
url :
	 https://github.com/clMathLibraries/clFFT/archive/v2.12.2.tar.gz
description :
	 FFT functions written in OpenCL
build_deps :
	 boost
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "../src", "-DBUILD_EXAMPLES:BOOL=OFF", "-DBUILD_TEST:BOOL=OFF", *std_cmake_args
	 system "make", "install"
