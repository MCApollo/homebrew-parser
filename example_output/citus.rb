name :
	 Citus
homepage :
	 https://www.citusdata.com
url :
	 https://github.com/citusdata/citus/archive/v8.0.1.tar.gz
description :
	 PostgreSQL-based distributed RDBMS
build_deps :
link_deps :
	 postgresql
	 readline
conflicts :
patches :
EOF_patch :
install :
	 ENV["PG_CONFIG"] = Formula["postgresql"].opt_bin/"pg_config"
	 system "./configure"
	 system "make", "libpq=-L#{Formula["postgresql"].opt_lib} -lpq"
	 mkdir "stage"
	 system "make", "install", "DESTDIR=#{buildpath}/stage"
	 bin.install Dir["stage/**/bin/*"]
	 lib.install Dir["stage/**/lib/*"]
	 include.install Dir["stage/**/include/*"]
	 (share/"postgresql/extension").install Dir["stage/**/share/postgresql/extension/*"]
