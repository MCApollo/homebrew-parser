name :
	 Virtualpg
homepage :
	 https://www.gaia-gis.it/fossil/virtualpg/index
url :
	 https://www.gaia-gis.it/gaia-sins/virtualpg-1.0.2.tar.gz
description :
	 Loadable dynamic extension for SQLite and SpatiaLite
build_deps :
link_deps :
	 libspatialite
	 postgis
conflicts :
patches :
EOF_patch :
install :
	 inreplace "configure",
	 "shrext_cmds='`test .$module = .yes && echo .so || echo .dylib`'",
	 "shrext_cmds='.dylib'"
	 system "./configure", "--enable-shared=yes",
	 "--disable-dependency-tracking",
	 "--with-pgconfig=#{Formula["postgresql"].opt_bin}/pg_config",
	 "--prefix=#{prefix}"
	 system "make", "install"
