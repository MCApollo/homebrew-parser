name :
	 GmtAT4
homepage :
	 https://gmt.soest.hawaii.edu/
url :
	 ftp://ftp.soest.hawaii.edu/gmt/gmt-4.5.18-src.tar.bz2
description :
	 Manipulation of geographic and Cartesian data sets
build_deps :
link_deps :
	 gdal
	 netcdf
optional_deps :
conflicts :
resource :
	 ['gshhg']
	 ['ftp://ftp.soest.hawaii.edu/gmt/gshhg-gmt-2.3.7.tar.gz']
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}",
	 "--datadir=#{share}/gmt4",
	 "--enable-gdal=#{Formula["gdal"].opt_prefix}",
	 "--enable-netcdf=#{Formula["netcdf"].opt_prefix}",
	 "--enable-shared",
	 "--enable-triangle",
	 "--disable-xgrid",
	 "--disable-mex"
	 system "make"
	 system "make", "install-gmt", "install-data", "install-suppl", "install-man"
	 (share/"gmt4").install resource("gshhg")
