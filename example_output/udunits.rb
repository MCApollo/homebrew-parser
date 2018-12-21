name :
	 Udunits
homepage :
	 https://www.unidata.ucar.edu/software/udunits/
url :
	 ftp://ftp.unidata.ucar.edu/pub/udunits/udunits-2.2.26.tar.gz
description :
	 Unidata unit conversion library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
