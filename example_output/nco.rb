name :
	 Nco
homepage :
	 https://nco.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/nco/nco-4.7.6.tar.gz
description :
	 Command-line operators for netCDF and HDF files
build_deps :
link_deps :
	 antlr@2
	 gsl
	 netcdf
	 texinfo
	 udunits
optional_deps :
conflicts :
resource :
	 ['example_nc']
	 ['https://www.unidata.ucar.edu/software/netcdf/examples/WMI_Lear.nc']
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-netcdf4"
	 system "make", "install"
