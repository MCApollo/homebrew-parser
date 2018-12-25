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
optional_deps :
conflicts :
resource :
	 ['setuptools', 'futures', 'six', 'thrift', 'cql', 'cassandra-driver']
	 ['https://files.pythonhosted.org/packages/d3/3e/1d74cdcb393b68ab9ee18d78c11ae6df8447099f55fe86ee842f9c5b166c/setuptools-40.0.0.zip', 'https://files.pythonhosted.org/packages/1f/9e/7b2ff7e965fc654592269f2906ade1c7d705f1bf25b7d469fa153f7d19eb/futures-3.2.0.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/c6/b4/510617906f8e0c5660e7d96fbc5585113f83ad547a3989b80297ac72a74c/thrift-0.11.0.tar.gz', 'https://files.pythonhosted.org/packages/0b/15/523f6008d32f05dd3c6a2e7c2f21505f0a785b6dc8949cad325306858afc/cql-1.4.0.tar.gz', 'https://files.pythonhosted.org/packages/4b/10/a464029e6bcfcde7ba9db5b0b8a25b28b2f09d3e270b68ce04a96f2b1876/cassandra-driver-3.14.0.tar.gz']
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
