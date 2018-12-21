name :
	 Scalapack
homepage :
	 https://www.netlib.org/scalapack/
url :
	 https://www.netlib.org/scalapack/scalapack-2.0.2.tgz
description :
	 High-performance linear algebra for distributed memory machines
build_deps :
	 cmake
link_deps :
	 gcc
	 open-mpi
	 veclibfort
	 openblas
conflicts :
patches :
EOF_patch :
install :
	 if build.with? "openblas"
	 blas = "-L#{Formula["openblas"].opt_lib} -lopenblas"
	 else
	 blas = "-L#{Formula["veclibfort"].opt_lib} -lvecLibFort"
