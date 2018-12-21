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
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-netcdf4"
	 system "make", "install"
