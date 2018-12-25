name :
	 CassandraAT22
homepage :
	 https://cassandra.apache.org
url :
	 https://www.apache.org/dyn/closer.cgi?path=/cassandra/2.2.11/apache-cassandra-2.2.11-bin.tar.gz
description :
	 Eventually consistent, distributed key-value db
build_deps :
	 cython
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 ['setuptools', 'futures', 'six', 'thrift', 'cql', 'cassandra-driver']
	 ['https://files.pythonhosted.org/packages/a4/c8/9a7a47f683d54d83f648d37c3e180317f80dc126a304c45dc6663246233a/setuptools-36.5.0.zip', 'https://files.pythonhosted.org/packages/cc/26/b61e3a4eb50653e8a7339d84eeaa46d1e93b92951978873c220ae64d0733/futures-3.1.1.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/a3/ea/84a41e03f1ab14fb314c8bcf1c451090efa14c5cdfb9797d1079f502b54e/thrift-0.10.0.zip', 'https://files.pythonhosted.org/packages/0b/15/523f6008d32f05dd3c6a2e7c2f21505f0a785b6dc8949cad325306858afc/cql-1.4.0.tar.gz', 'https://files.pythonhosted.org/packages/5a/96/a5b2458a0483d3cefdf13064d40119754c1552ea34b7f0e8c6e03e66eb0a/cassandra-driver-3.11.0.tar.gz']
patches :
EOF_patch :
install :
	 (var+"lib/cassandra").mkpath
	 (var+"log/cassandra").mkpath
	 pypath = libexec/"vendor/lib/python2.7/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", pypath
	 %w[setuptools thrift futures six cql cassandra-driver].each do |r|
	 resource(r).stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
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
	 (etc+"cassandra").install Dir["conf/*"]
	 libexec.install Dir["*.txt", "{bin,interface,javadoc,pylib,lib/licenses}"]
	 libexec.install Dir["lib/*.jar"]
	 share.install [libexec+"bin/cassandra.in.sh", libexec+"bin/stop-server"]
	 inreplace Dir["#{libexec}/bin/cassandra*", "#{libexec}/bin/debug-cql", "#{libexec}/bin/nodetool", "#{libexec}/bin/sstable*"],
	 %r{`dirname "?\$0"?`/cassandra.in.sh},
	 "#{share}/cassandra.in.sh"
	 bin.write_exec_script Dir["#{libexec}/bin/*"]
	 rm bin/"cqlsh"
	 (bin/"cqlsh").write_env_script libexec/"bin/cqlsh", :PYTHONPATH => pypath
