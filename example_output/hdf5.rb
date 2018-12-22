name :
	 Hdf5
homepage :
	 https://www.hdfgroup.org/HDF5
url :
	 https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.4/src/hdf5-1.10.4.tar.bz2
description :
	 File format designed to store large amounts of data
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 gcc
	 open-mpi
	 szip
conflicts :
patches :
EOF_patch :
install :
	 inreplace %w[c++/src/h5c++.in fortran/src/h5fc.in tools/src/misc/h5cc.in],
	 "${libdir}/libhdf5.settings", "#{pkgshare}/libhdf5.settings"
	 inreplace "src/Makefile.am", "settingsdir=$(libdir)", "settingsdir=#{pkgshare}"
	 system "autoreconf", "-fiv"
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --with-szlib=#{Formula["szip"].opt_prefix}
	 --enable-build-mode=production
	 --enable-fortran
	 ]
	 if build.without?("mpi")
	 args << "--enable-cxx"
	 else
	 args << "--disable-cxx"
	 end
	 if build.with? "mpi"
	 ENV["CC"] = "mpicc"
	 ENV["CXX"] = "mpicxx"
	 ENV["FC"] = "mpif90"
	 args << "--enable-parallel"
	 end
	 system "./configure", *args
	 system "make", "install"
