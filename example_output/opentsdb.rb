name :
	 Opentsdb
homepage :
	 http://opentsdb.net/
url :
	 https://github.com/OpenTSDB/opentsdb/releases/download/v2.3.1/opentsdb-2.3.1.tar.gz
description :
	 Scalable, distributed Time Series Database
build_deps :
link_deps :
	 hbase
	 :java
	 lzo
	 gnuplot
conflicts :
patches :
EOF_patch :
install :
	 system "./configure",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--sysconfdir=#{etc}",
	 "--localstatedir=#{var}/opentsdb"
	 system "make"
	 bin.mkpath
	 (pkgshare/"static/gwt/opentsdb/images/ie6").mkpath
	 system "make", "install"
	 env = {
	 :HBASE_HOME  => Formula["hbase"].opt_libexec,
	 :COMPRESSION => "LZO",
	 }
	 env = Language::Java.java_home_env("1.8").merge(env)
	 create_table = pkgshare/"tools/create_table_with_env.sh"
	 create_table.write_env_script pkgshare/"tools/create_table.sh", env
	 create_table.chmod 0755
	 inreplace pkgshare/"etc/opentsdb/opentsdb.conf", "/usr/share", "#{HOMEBREW_PREFIX}/share"
	 etc.install pkgshare/"etc/opentsdb"
	 (pkgshare/"plugins/.keep").write ""
	 (bin/"start-tsdb.sh").write <<~EOS
	 #!/bin/sh
	 exec "#{opt_bin}/tsdb" tsd \\
	 --config="#{etc}/opentsdb/opentsdb.conf" \\
	 --staticroot="#{opt_pkgshare}/static/" \\
	 --cachedir="#{var}/cache/opentsdb" \\
	 --port=4242 \\
	 --zkquorum=localhost:2181 \\
	 --zkbasedir=/hbase \\
	 --auto-metric \\
	 "$@"
	 EOS
	 (bin/"start-tsdb.sh").chmod 0755
	 libexec.mkpath
	 bin.env_script_all_files(libexec, env)
	 (var/"cache/opentsdb").mkpath
	 system "#{Formula["hbase"].opt_bin}/start-hbase.sh"
	 begin
	 sleep 2
	 system "#{pkgshare}/tools/create_table_with_env.sh"
	 ensure
	 system "#{Formula["hbase"].opt_bin}/stop-hbase.sh"
