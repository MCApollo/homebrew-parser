name :
	 Ncview
homepage :
	 http://meteora.ucsd.edu/~pierce/ncview_home_page.html
url :
	 ftp://cirrus.ucsd.edu/pub/ncview/ncview-2.1.7.tar.gz
description :
	 Visual browser for netCDF format files
build_deps :
link_deps :
	 netcdf
	 udunits
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 inreplace "configure",
	 "if test x$CC_TEST_SAME != x$NETCDF_CC_TEST_SAME; then",
	 "if false; then"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 man1.install "data/ncview.1"
