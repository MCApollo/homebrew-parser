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
optional_deps :
	 openblas
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.with? "openblas"
	 blas = "-L#{Formula["openblas"].opt_lib} -lopenblas"
	 else
	 blas = "-L#{Formula["veclibfort"].opt_lib} -lvecLibFort"
	 end
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args, "-DBUILD_SHARED_LIBS=ON",
	 "-DBLAS_LIBRARIES=#{blas}", "-DLAPACK_LIBRARIES=#{blas}"
	 system "make", "all"
	 system "make", "install"
	 end
	 pkgshare.install "EXAMPLE"
