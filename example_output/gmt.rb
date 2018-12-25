name :
	 Gmt
homepage :
	 https://gmt.soest.hawaii.edu/
url :
	 ftp://ftp.soest.hawaii.edu/gmt/gmt-5.4.4-src.tar.xz
description :
	 Tools for processing and displaying xy and xyz datasets
build_deps :
	 cmake
link_deps :
	 fftw
	 gdal
	 netcdf
	 pcre
optional_deps :
conflicts :
resource :
	 ['gshhg', 'dcw']
	 ['ftp://ftp.soest.hawaii.edu/gmt/gshhg-gmt-2.3.7.tar.gz', 'ftp://ftp.soest.hawaii.edu/gmt/dcw-gmt-1.1.4.tar.gz']
patches :
EOF_patch :
install :
	 (buildpath/"gshhg").install resource("gshhg")
	 (buildpath/"dcw").install resource("dcw")
	 args = std_cmake_args.concat %W[
	 -DCMAKE_INSTALL_PREFIX=#{prefix}
	 -DGMT_DOCDIR=#{share}/doc/gmt
	 -DGMT_MANDIR=#{man}
	 -DGSHHG_ROOT=#{buildpath}/gshhg
	 -DCOPY_GSHHG:BOOL=TRUE
	 -DDCW_ROOT=#{buildpath}/dcw
	 -DCOPY_DCW:BOOL=TRUE
	 -DFFTW3_ROOT=#{Formula["fftw"].opt_prefix}
	 -DGDAL_ROOT=#{Formula["gdal"].opt_prefix}
	 -DNETCDF_ROOT=#{Formula["netcdf"].opt_prefix}
	 -DPCRE_ROOT=#{Formula["pcre"].opt_prefix}
	 -DFLOCK:BOOL=TRUE
	 -DGMT_INSTALL_MODULE_LINKS:BOOL=TRUE
	 -DGMT_INSTALL_TRADITIONAL_FOLDERNAMES:BOOL=FALSE
	 -DLICENSE_RESTRICTED:BOOL=FALSE
	 ]
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make", "install"
	 end
