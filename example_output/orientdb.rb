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
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_rf Dir["{bin,benchmarks}/*.{bat,exe}"]
	 chmod 0755, Dir["bin/*"]
	 libexec.install Dir["*"]
	 inreplace "#{libexec}/config/orientdb-server-config.xml", "</properties>",
	 <<~EOS
	 <entry name="server.database.path" value="#{var}/db/orientdb" />
	 </properties>
	 EOS
	 inreplace "#{libexec}/config/orientdb-server-log.properties", "../log", "#{var}/log/orientdb"
	 inreplace "#{libexec}/bin/orientdb.sh", "../log", "#{var}/log/orientdb"
	 inreplace "#{libexec}/bin/server.sh", "ORIENTDB_PID=$ORIENTDB_HOME/bin", "ORIENTDB_PID=#{var}/run/orientdb"
	 inreplace "#{libexec}/bin/shutdown.sh", "ORIENTDB_PID=$ORIENTDB_HOME/bin", "ORIENTDB_PID=#{var}/run/orientdb"
	 inreplace "#{libexec}/bin/orientdb.sh", '"YOUR_ORIENTDB_INSTALLATION_PATH"', libexec
	 inreplace "#{libexec}/bin/orientdb.sh", 'su $ORIENTDB_USER -c "cd \"$ORIENTDB_DIR/bin\";', ""
	 inreplace "#{libexec}/bin/orientdb.sh", '&"', "&"
	 bin.install_symlink "#{libexec}/bin/orientdb.sh" => "orientdb"
	 bin.install_symlink "#{libexec}/bin/console.sh" => "orientdb-console"
	 bin.install_symlink "#{libexec}/bin/gremlin.sh" => "orientdb-gremlin"
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
