name :
	 Openblas
homepage :
	 https://www.openblas.net/
url :
	 https://github.com/xianyi/OpenBLAS/archive/v0.3.4.tar.gz
description :
	 Optimized BLAS library
build_deps :
link_deps :
	 gcc
conflicts :
patches :
EOF_patch :
install :
	 ENV["DYNAMIC_ARCH"] = "1" if build.bottle?
	 ENV["USE_OPENMP"] = "1" if build.with? "openmp"
	 system "make", "CC=#{ENV.cc}", "FC=gfortran", "libs", "netlib", "shared"
	 system "make", "PREFIX=#{prefix}", "install"
	 lib.install_symlink "libopenblas.dylib" => "libblas.dylib"
	 lib.install_symlink "libopenblas.dylib" => "liblapack.dylib"
