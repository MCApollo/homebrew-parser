name :
	 Cassandra
homepage :
	 https://cassandra.apache.org
url :
	 https://www.apache.org/dyn/closer.cgi?path=cassandra/3.11.3/apache-cassandra-3.11.3-bin.tar.gz
description :
	 Eventually consistent, distributed key-value store
build_deps :
link_deps :
	 cython
	 python
conflicts :
patches :
EOF_patch :
install :
	 (var/"lib/cassandra").mkpath
	 (var/"log/cassandra").mkpath
	 xy = Language::Python.major_minor_version "python3"
	 pypath = libexec/"vendor/lib/python#{xy}/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", pypath
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 inreplace "conf/cassandra.yaml", "/var/lib/cassandra", "#{var}/lib/cassandra"
	 inreplace "conf/cassandra-env.sh", "/lib/", "/"
	 inreplace "bin/cassandra", "-Dcassandra.logdir\=$CASSANDRA_HOME/logs", "-Dcassandra.logdir\=#{var}/log/cassandra"
	 inreplace "bin/cassandra.in.sh" do |s|
	 s.gsub! "CASSANDRA_HOME=\"`dirname \"$0\"`/..\"", "CASSANDRA_HOME=\"#{libexec}\""
	 s.gsub! "CASSANDRA_CONF=\"$CASSANDRA_HOME/conf\"", "CASSANDRA_CONF=\"#{etc}/cassandra\""
	 s.gsub! "\"$CASSANDRA_HOME\"/lib/*.jar", "\"$CASSANDRA_HOME\"/*.jar"
	 s.gsub! "JAVA_AGENT=\"$JAVA_AGENT -javaagent:$CASSANDRA_HOME/lib/jamm-", "JAVA_AGENT=\"$JAVA_AGENT -javaagent:$CASSANDRA_HOME/jamm-"
	 s.gsub! "cassandra_storagedir\=\"$CASSANDRA_HOME/data\"", "cassandra_storagedir\=\"#{var}/lib/cassandra\""
	 end
	 rm Dir["bin/*.bat", "bin/*.ps1"]
	 (etc/"cassandra").install Dir["conf/*"]
	 libexec.install Dir["*.txt", "{bin,interface,javadoc,pylib,lib/licenses}"]
	 libexec.install Dir["lib/*.jar"]
	 pkgshare.install [libexec/"bin/cassandra.in.sh", libexec/"bin/stop-server"]
	 inreplace Dir["#{libexec}/bin/cassandra*", "#{libexec}/bin/debug-cql", "#{libexec}/bin/nodetool", "#{libexec}/bin/sstable*"],
	 %r{`dirname "?\$0"?`/cassandra.in.sh},
	 "#{pkgshare}/cassandra.in.sh"
	 rm Dir[buildpath/"tools/bin/*.bat"]
	 (libexec/"tools").install Dir[buildpath/"tools/lib/*.jar"]
	 mv buildpath/"tools/bin/cassandra.in.sh", buildpath/"tools/bin/cassandra-tools.in.sh"
	 inreplace buildpath/"tools/bin/cassandra-tools.in.sh" do |s|
	 s.gsub! "CASSANDRA_HOME=\"`dirname $0`/../..\"", "CASSANDRA_HOME=\"#{libexec}\""
	 s.gsub! "CASSANDRA_CONF=\"$CASSANDRA_HOME/conf\"", "CASSANDRA_CONF=\"#{etc}/cassandra\""
	 s.gsub! "\"$CASSANDRA_HOME\"/lib/*.jar", "\"$CASSANDRA_HOME\"/*.jar"
	 s.gsub! "\"$CASSANDRA_HOME\"/tools/lib/*.jar", "\"$CASSANDRA_HOME\"/tools/*.jar"
	 s.gsub! "cassandra_storagedir\=\"$CASSANDRA_HOME/data\"", "cassandra_storagedir\=\"#{var}/lib/cassandra\""
	 end
	 pkgshare.install [buildpath/"tools/bin/cassandra-tools.in.sh"]
	 inreplace Dir[buildpath/"tools/bin/*"],
	 "`dirname \"$0\"`/cassandra.in.sh",
	 "#{pkgshare}/cassandra-tools.in.sh"
	 bin.install Dir[buildpath/"tools/bin/*"]
	 bin.write_exec_script Dir["#{libexec}/bin/*"]
	 rm %W[
	 (bin/"cqlsh").write_env_script libexec/"bin/cqlsh", :PYTHONPATH => pypath
	 (bin/"cqlsh.py").write_env_script libexec/"bin/cqlsh.py", :PYTHONPATH => pypath
