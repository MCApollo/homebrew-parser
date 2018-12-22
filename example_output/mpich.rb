name :
	 Mpich
homepage :
	 https://www.mpich.org/
url :
	 https://www.mpich.org/static/downloads/3.3/mpich-3.3.tar.gz
description :
	 Implementation of the MPI Message Passing Interface standard
build_deps :
link_deps :
	 gcc
conflicts :
	 open-mpi
patches :
EOF_patch :
install :
	 if build.head?
	 ENV["MPICH_AUTOTOOLS_DIR"] = HOMEBREW_PREFIX + "bin"
	 system "./autogen.sh"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
