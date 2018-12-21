name :
	 Orientdb
homepage :
	 https://orientdb.com/
url :
	 https://orientdb.com/download.php?file=orientdb-community-importers-2.2.29.tar.gz
description :
	 Graph database
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 (var/"db/orientdb").mkpath
	 (var/"run/orientdb").mkpath
	 (var/"log/orientdb").mkpath
	 touch "#{var}/log/orientdb/orientdb.err"
	 touch "#{var}/log/orientdb/orientdb.log"
	 ENV["ORIENTDB_ROOT_PASSWORD"] = "orientdb"
	 system "#{bin}/orientdb", "stop"
	 sleep 3
	 system "#{bin}/orientdb", "start"
	 sleep 3
	 ensure
	 system "#{bin}/orientdb", "stop"
