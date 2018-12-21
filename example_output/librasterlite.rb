name :
	 Librasterlite
homepage :
	 https://www.gaia-gis.it/fossil/librasterlite/index
url :
	 https://www.gaia-gis.it/gaia-sins/librasterlite-sources/librasterlite-1.1g.tar.gz
description :
	 Library to store and retrieve huge raster coverages
build_deps :
	 pkg-config
link_deps :
	 libgeotiff
	 libpng
	 libspatialite
	 sqlite
conflicts :
patches :
EOF_patch :
install :
	 sqlite = Formula["sqlite"]
	 ENV.append "LDFLAGS", "-L#{sqlite.opt_lib} -lsqlite3"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
