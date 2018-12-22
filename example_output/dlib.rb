name :
	 Dlib
homepage :
	 http://dlib.net/
url :
	 http://dlib.net/files/dlib-19.16.tar.bz2
description :
	 C++ library for machine learning
build_deps :
	 cmake
link_deps :
	 jpeg
	 libpng
	 :macos
	 openblas
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 args = std_cmake_args + %w[-DDLIB_USE_BLAS=ON -DDLIB_USE_LAPACK=ON]
	 args << "-DDLIB_NO_GUI_SUPPORT=ON" if build.without? "x11"
	 args << "-DUSE_SSE2_INSTRUCTIONS=ON"
	 unless build.bottle?
	 args << "-DUSE_AVX_INSTRUCTIONS=ON" if Hardware::CPU.avx?
	 args << "-DUSE_SSE4_INSTRUCTIONS=ON" if Hardware::CPU.sse4?
	 end
	 if build.with? "openblas"
	 args << "-Dcblas_lib=#{Formula["openblas"].opt_lib}/libopenblas.dylib"
	 args << "-Dlapack_lib=#{Formula["openblas"].opt_lib}/libopenblas.dylib"
	 else
	 args << "-Dcblas_lib=/usr/lib/libcblas.dylib"
	 args << "-Dlapack_lib=/usr/lib/liblapack.dylib"
	 end
	 mkdir "dlib/build" do
	 system "cmake", "..", *args
	 system "make", "install"
	 end
