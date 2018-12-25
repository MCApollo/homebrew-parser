name :
	 Hwloc
homepage :
	 https://www.open-mpi.org/projects/hwloc/
url :
	 https://www.open-mpi.org/software/hwloc/v2.0/downloads/hwloc-2.0.2.tar.bz2
description :
	 Portable abstraction of the hierarchical topology of modern architectures
build_deps :
	 pkg-config
link_deps :
optional_deps :
	 cairo
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--enable-shared",
	 "--enable-static",
	 "--prefix=#{prefix}",
	 "--without-x"
	 system "make", "install"
	 pkgshare.install "tests"
