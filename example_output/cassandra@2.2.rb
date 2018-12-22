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
conflicts :
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
