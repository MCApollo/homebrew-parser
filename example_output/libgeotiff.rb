name :
	 Libgeotiff
homepage :
	 https://geotiff.osgeo.org/
url :
	 https://download.osgeo.org/geotiff/libgeotiff/libgeotiff-1.4.2.tar.gz
description :
	 Library and tools for dealing with GeoTIFF
build_deps :
link_deps :
	 jpeg
	 libtiff
	 proj
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-jpeg"
	 system "make"
	 system "make", "install"
