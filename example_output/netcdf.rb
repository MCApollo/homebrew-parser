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
optional_deps :
conflicts :
resource :
	 ['cxx', 'cxx-compat', 'fortran']
	 ['https://github.com/Unidata/netcdf-cxx4/archive/v4.3.0.tar.gz', 'https://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-cxx-4.2.tar.gz', 'https://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-fortran-4.4.4.tar.gz']
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
	 end
	 args = common_args.dup << "-DNETCDF_C_LIBRARY=#{lib}"
	 cxx_args = args.dup
	 cxx_args << "-DNCXX_ENABLE_TESTS=OFF"
	 resource("cxx").stage do
	 mkdir "build-cxx" do
	 system "cmake", "..", "-DBUILD_SHARED_LIBS=ON", *cxx_args
	 system "make", "install"
	 system "make", "clean"
	 system "cmake", "..", "-DBUILD_SHARED_LIBS=OFF", *cxx_args
	 system "make"
	 lib.install "cxx4/libnetcdf-cxx4.a"
	 end
	 end
	 fortran_args = args.dup
	 fortran_args << "-DENABLE_TESTS=OFF"
	 resource("fortran").stage do
	 mkdir "build-fortran" do
	 system "cmake", "..", "-DBUILD_SHARED_LIBS=ON", *fortran_args
	 system "make", "install"
	 system "make", "clean"
	 system "cmake", "..", "-DBUILD_SHARED_LIBS=OFF", *fortran_args
	 system "make"
	 lib.install "fortran/libnetcdff.a"
	 end
	 end
	 ENV.prepend "CPPFLAGS", "-I#{include}"
	 ENV.prepend "LDFLAGS", "-L#{lib}"
	 resource("cxx-compat").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--enable-shared",
	 "--enable-static",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 end
	 libnetcdf = (lib/"libnetcdf.dylib").readlink
	 %w[libnetcdf-cxx4.dylib libnetcdf_c++.dylib].each do |f|
	 macho = MachO.open("#{lib}/#{f}")
	 macho.change_dylib("@rpath/#{libnetcdf}",
	 "#{lib}/#{libnetcdf}")
	 macho.write!
	 end
