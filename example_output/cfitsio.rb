name :
	 Cfitsio
homepage :
	 https://heasarc.gsfc.nasa.gov/docs/software/fitsio/fitsio.html
url :
	 https://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio3450.tar.gz
description :
	 C access to FITS data files with optional Fortran wrappers
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = ["--prefix=#{prefix}"]
	 args << "--enable-reentrant" if build.with? "reentrant"
	 system "./configure", *args
	 system "make", "shared"
	 system "make", "install"
	 (pkgshare/"testprog").install Dir["testprog*"]
