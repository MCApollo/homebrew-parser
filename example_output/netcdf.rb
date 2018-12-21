name :
	 Netcdf
homepage :
	 https://www.unidata.ucar.edu/software/netcdf
url :
	 https://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-4.6.1.tar.gz
description :
	 Libraries and data formats for array-oriented scientific data
build_deps :
	 cmake
link_deps :
	 gcc
	 hdf5
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 common_args = std_cmake_args << "-DBUILD_TESTING=OFF"
	 mkdir "build" do
	 args = common_args.dup
	 args << "-DENABLE_TESTS=OFF"
	 args << "-DNC_EXTRA_DEPS=-lmpi" if Tab.for_name("hdf5").with? "mpi"
	 args << "-DENABLE_DAP_AUTH_TESTS=OFF" << "-DENABLE_NETCDF_4=ON" << "-DENABLE_DOXYGEN=OFF"
	 system "cmake", "..", "-DBUILD_SHARED_LIBS=ON", *args
	 system "make", "install"
	 system "make", "clean"
	 system "cmake", "..", "-DBUILD_SHARED_LIBS=OFF", *args
	 system "make"
	 lib.install "liblib/libnetcdf.a"
