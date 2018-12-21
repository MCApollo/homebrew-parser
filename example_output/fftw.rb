name :
	 Fftw
homepage :
	 http://www.fftw.org
url :
	 http://fftw.org/fftw-3.3.8.tar.gz
description :
	 C routines to compute the Discrete Fourier Transform
build_deps :
link_deps :
	 gcc
	 open-mpi
conflicts :
patches :
EOF_patch :
install :
	 args = ["--enable-shared",
	 "--disable-debug",
	 "--prefix=#{prefix}",
	 "--enable-threads",
	 "--disable-dependency-tracking"]
	 simd_args = ["--enable-sse2"]
	 simd_args << "--enable-avx" if ENV.compiler == :clang && Hardware::CPU.avx? && !build.bottle?
	 simd_args << "--enable-avx2" if ENV.compiler == :clang && Hardware::CPU.avx2? && !build.bottle?
	 args << "--disable-fortran" if build.without? "fortran"
	 args << "--enable-mpi" if build.with? "mpi"
	 args << "--enable-openmp" if build.with? "openmp"
	 system "./configure", "--enable-single", *(args + simd_args)
	 system "make", "install"
	 system "make", "clean"
	 system "./configure", *(args + simd_args)
	 system "make", "install"
	 system "make", "clean"
	 system "./configure", "--enable-long-double", *args
	 system "make", "install"
