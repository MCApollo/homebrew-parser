name :
	 Wcslib
homepage :
	 https://www.atnf.csiro.au/people/mcalabre/WCS/
url :
	 https://www.atnf.csiro.au/pub/software/wcslib/wcslib-6.2.tar.bz2
description :
	 Library and utilities for the FITS World Coordinate System
build_deps :
link_deps :
	 cfitsio
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-cfitsiolib=#{Formula["cfitsio"].opt_lib}",
	 "--with-cfitsioinc=#{Formula["cfitsio"].opt_include}",
	 "--without-pgplot",
	 "--disable-fortran"
	 ENV.deparallelize
	 system "make"
	 system "make", "install"
