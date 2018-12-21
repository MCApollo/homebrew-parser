name :
	 TemporalTables
homepage :
	 https://pgxn.org/dist/temporal_tables/
url :
	 https://github.com/arkhipov/temporal_tables/archive/v1.2.0.tar.gz
description :
	 Temporal Tables PostgreSQL Extension
build_deps :
link_deps :
	 postgresql
conflicts :
patches :
	 https://github.com/mlt/temporal_tables/commit/24906c44.diff?full_index=1
EOF_patch :
install :
	 ENV["PG_CONFIG"] = Formula["postgresql"].opt_bin/"pg_config"
	 mkdir "stage"
	 system "make", "install", "DESTDIR=#{buildpath}/stage"
	 lib.install Dir["stage/**/lib/*"]
	 (share/"postgresql/extension").install Dir["stage/**/share/postgresql/extension/*"]
