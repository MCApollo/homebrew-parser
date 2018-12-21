name :
	 Arpack
homepage :
	 https://github.com/opencollab/arpack-ng
url :
	 https://github.com/opencollab/arpack-ng/archive/3.6.3.tar.gz
description :
	 Routines to solve large scale eigenvalue problems
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 gcc
	 open-mpi
	 veclibfort
conflicts :
patches :
EOF_patch :
install :
	 args = %W[ --disable-dependency-tracking
	 --prefix=#{libexec}
	 --with-blas=-L#{Formula["veclibfort"].opt_lib}\ -lvecLibFort ]
	 args << "F77=mpif77" << "--enable-mpi" if build.with? "mpi"
	 system "./bootstrap"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 lib.install_symlink Dir["#{libexec}/lib/*"].select { |f| File.file?(f) }
	 (lib/"pkgconfig").install_symlink Dir["#{libexec}/lib/pkgconfig/*"]
	 pkgshare.install "TESTS/testA.mtx", "TESTS/dnsimp.f",
	 "TESTS/mmio.f", "TESTS/debug.h"
	 if build.with? "mpi"
	 (libexec/"bin").install (buildpath/"PARPACK/EXAMPLES/MPI").children
