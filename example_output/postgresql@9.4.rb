name :
	 PostgresqlAT94
homepage :
	 https://www.postgresql.org/
url :
	 https://ftp.postgresql.org/pub/source/v9.4.19/postgresql-9.4.19.tar.bz2
description :
	 Object-relational database system
build_deps :
link_deps :
	 openssl
	 readline
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
	 (var/"log").mkpath
	 (var/name).mkpath
	 unless File.exist? "#{var}/#{name}/PG_VERSION"
	 system "#{bin}/initdb", "#{var}/#{name}"
