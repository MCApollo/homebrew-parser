name :
	 Postgis
homepage :
	 https://postgis.net/
url :
	 https://download.osgeo.org/postgis/source/postgis-2.5.0.tar.gz
description :
	 Adds support for geographic objects to PostgreSQL
build_deps :
	 gpp
	 pkg-config
link_deps :
	 gdal
	 geos
	 gtk+
	 json-c
	 pcre
	 postgresql
	 proj
	 sfcgal
	 protobuf-c
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 args = [
	 "--with-projdir=#{Formula["proj"].opt_prefix}",
	 "--with-jsondir=#{Formula["json-c"].opt_prefix}",
	 "--with-pgconfig=#{Formula["postgresql"].opt_bin}/pg_config",
	 "--disable-nls",
	 ]
	 args << "--with-gui" if build.with? "gui"
	 args << "--with-protobufdir=#{Formula["protobuf-c"].opt_bin}" if build.with? "protobuf-c"
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make"
	 mkdir "stage"
	 system "make", "install", "DESTDIR=#{buildpath}/stage"
	 bin.install Dir["stage/**/bin/*"]
	 lib.install Dir["stage/**/lib/*"]
	 include.install Dir["stage/**/include/*"]
	 (doc/"postgresql/extension").install Dir["stage/**/share/doc/postgresql/extension/*"]
	 (share/"postgresql/extension").install Dir["stage/**/share/postgresql/extension/*"]
	 pkgshare.install Dir["stage/**/contrib/postgis-*/*"]
	 (share/"postgis_topology").install Dir["stage/**/contrib/postgis_topology-*/*"]
	 bin.install %w[
	 utils/create_undef.pl
	 utils/postgis_proc_upgrade.pl
	 utils/postgis_restore.pl
	 utils/profile_intersects.pl
	 utils/test_estimation.pl
	 utils/test_geography_estimation.pl
	 utils/test_geography_joinestimation.pl
	 utils/test_joinestimation.pl
	 ]
	 man1.install Dir["doc/**/*.1"]
