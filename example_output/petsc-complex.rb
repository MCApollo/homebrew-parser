name :
	 PetscComplex
homepage :
	 https://www.mcs.anl.gov/petsc/
url :
	 http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-3.9.3.tar.gz
description :
	 Portable, Extensible Toolkit for Scientific Computation (complex)
build_deps :
link_deps :
	 hdf5
	 hwloc
	 metis
	 netcdf
	 open-mpi
	 scalapack
	 suite-sparse
optional_deps :
conflicts :
	 petsc
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["CC"] = "mpicc"
	 ENV["CXX"] = "mpicxx"
	 ENV["F77"] = "mpif77"
	 ENV["FC"] = "mpif90"
	 system "./configure", "--prefix=#{prefix}",
	 "--with-debugging=0",
	 "--with-scalar-type=complex",
	 "--with-x=0"
	 system "make", "all"
	 system "make", "install"
