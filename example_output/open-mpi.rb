name :
	 OpenMpi
homepage :
	 https://www.open-mpi.org/
url :
	 https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.0.tar.bz2
description :
	 High performance message passing library
build_deps :
link_deps :
	 gcc
	 libevent
conflicts :
	 mpich
patches :
EOF_patch :
install :
	 ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
	 ENV.cxx11
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --enable-ipv6
	 --with-libevent=#{Formula["libevent"].opt_prefix}
	 --with-sge
	 ]
	 args << "--with-platform-optimized" if build.head?
	 args << "--enable-mpi-cxx" if build.with? "cxx-bindings"
	 args << "--enable-mpi1-compatibility"
	 system "./autogen.pl" if build.head?
	 system "./configure", *args
	 system "make", "all"
	 system "make", "check"
	 system "make", "install"
	 include.install Dir["#{lib}/*.mod"]
