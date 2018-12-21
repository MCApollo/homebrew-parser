name :
	 Cp2k
homepage :
	 https://www.cp2k.org/
url :
	 https://github.com/cp2k/cp2k/releases/download/v5.1.0/cp2k-5.1.tar.bz2
description :
	 Quantum chemistry and solid state physics software package
build_deps :
link_deps :
	 fftw
	 gcc
	 libxc
	 open-mpi
	 scalapack
conflicts :
patches :
EOF_patch :
install :
	 resource("libint").stage do
	 system "./configure", "--prefix=#{libexec}"
	 system "make"
	 ENV.deparallelize { system "make", "install" }
