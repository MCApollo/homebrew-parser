name :
	 SpatialiteTools
homepage :
	 https://www.gaia-gis.it/fossil/spatialite-tools/index
url :
	 https://www.gaia-gis.it/gaia-sins/spatialite-tools-sources/spatialite-tools-4.3.0.tar.gz
description :
	 CLI tools supporting SpatiaLite
build_deps :
	 pkg-config
link_deps :
	 libspatialite
	 readosm
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-liconv"
	 sqlite = Formula["sqlite"]
	 ENV.append "LDFLAGS", "-L#{sqlite.opt_lib}"
	 ENV.append "CFLAGS", "-I#{sqlite.opt_include}"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
