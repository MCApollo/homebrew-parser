name :
	 Hypre
homepage :
	 https://computation.llnl.gov/casc/hypre/software.html
url :
	 https://computation.llnl.gov/projects/hypre-scalable-linear-solvers-multigrid-methods/download/hypre-2.11.2.tar.gz
description :
	 Library featuring parallel multigrid methods for grid problems
build_deps :
link_deps :
	 gcc
	 open-mpi
	 veclibfort
conflicts :
patches :
EOF_patch :
install :
	 cd "src" do
	 ENV["CC"] = ENV["MPICC"]
	 ENV["CXX"] = ENV["MPICXX"]
	 system "./configure", "--prefix=#{prefix}",
	 "--with-blas=yes",
	 "--with-blas-libs=blas cblas",
	 "--with-blas-lib-dirs=/usr/lib",
	 "--with-lapack=yes",
	 "--with-lapack-libs=lapack clapack f77lapack",
	 "--with-lapack-lib-dirs=/usr/lib",
	 "--with-MPI",
	 "--enable-bigint"
	 system "make", "install"
	 end
