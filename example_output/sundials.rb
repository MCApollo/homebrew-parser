name :
	 Sundials
homepage :
	 https://computation.llnl.gov/casc/sundials/main.html
url :
	 https://computation.llnl.gov/projects/sundials/download/sundials-4.0.0.tar.gz
description :
	 Nonlinear and differential/algebraic equations solver
build_deps :
	 cmake
link_deps :
	 gcc
	 open-mpi
	 suite-sparse
	 veclibfort
conflicts :
patches :
EOF_patch :
install :
	 blas = "-L#{Formula["veclibfort"].opt_lib} -lvecLibFort"
	 args = std_cmake_args + %W[
	 -DCMAKE_C_COMPILER=#{ENV["CC"]}
	 -DBUILD_SHARED_LIBS=ON
	 -DKLU_ENABLE=ON
	 -DKLU_LIBRARY_DIR=#{Formula["suite-sparse"].opt_lib}
	 -DKLU_INCLUDE_DIR=#{Formula["suite-sparse"].opt_include}
	 -DLAPACK_ENABLE=ON
	 -DLAPACK_LIBRARIES=#{blas};#{blas}
	 -DMPI_ENABLE=ON
	 ]
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make", "install"
