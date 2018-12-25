name :
	 Hbase
homepage :
	 https://hbase.apache.org
url :
	 https://www.apache.org/dyn/closer.cgi?path=hbase/hbase-1.2.8/hbase-1.2.8-bin.tar.gz
description :
	 Hadoop database: a distributed, scalable, big data store
build_deps :
	 ant
link_deps :
	 :arch
	 :java
	 lzo
optional_deps :
	 hadoop
conflicts :
resource :
	 ['hadoop-lzo']
	 ['https://github.com/cloudera/hadoop-lzo/archive/0.4.14.tar.gz']
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.cmd", "conf/*.cmd"]
	 libexec.install %w[bin conf docs lib hbase-webapps]
	 %w[hbase start-hbase.sh stop-hbase.sh].each do |script|
	 (bin/script).write_env_script "#{libexec}/bin/#{script}", Language::Java.java_home_env("1.8")
	 end
	 resource("hadoop-lzo").stage do
	 inreplace "build.xml",
	 %r{(<class name="com.hadoop.compression.lzo.LzoDecompressor" />)},
	 "\\1\n<classpath refid=\"classpath\"/>"
	 ENV["CLASSPATH"] = Dir["#{libexec}/lib/hadoop-common-*.jar"].first
	 ENV["CFLAGS"] = "-m64"
	 ENV["CXXFLAGS"] = "-m64"
	 ENV["CPPFLAGS"] = "-I/System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers"
	 system "ant", "compile-native", "tar"
	 (libexec/"lib").install Dir["build/hadoop-lzo-*/hadoop-lzo-*.jar"]
	 (libexec/"lib/native").install Dir["build/hadoop-lzo-*/lib/native/*"]
	 end
	 inreplace "#{libexec}/conf/hbase-env.sh" do |s|
	 s.gsub!("export HBASE_OPTS=\"-XX:+UseConcMarkSweepGC\"",
	 "export HBASE_OPTS=\"-Djava.net.preferIPv4Stack=true -XX:+UseConcMarkSweepGC\"")
	 s.gsub!("
	 "export JAVA_HOME=\"$(/usr/libexec/java_home --version 1.8)\"")
	 s.gsub!(" -XX:PermSize=128m -XX:MaxPermSize=128m", "")
	 s.gsub!(/^
	 "export HBASE_LOG_DIR=\"${HBASE_LOG_DIR:-#{var}/log/hbase}\"")
	 end
	 inreplace "#{libexec}/conf/hbase-site.xml",
	 /<configuration>/,
	 <<~EOS
	 <configuration>
	 <property>
	 <name>hbase.rootdir</name>
	 <value>#{build.with?("hadoop") ? "hdfs://localhost:9000" : "file://"+var}/hbase</value>
	 </property>
	 <property>
	 <name>hbase.zookeeper.property.clientPort</name>
	 <value>2181</value>
	 </property>
	 <property>
	 <name>hbase.zookeeper.property.dataDir</name>
	 <value>#{var}/zookeeper</value>
	 </property>
	 <property>
	 <name>hbase.zookeeper.dns.interface</name>
	 <value>lo0</value>
	 </property>
	 <property>
	 <name>hbase.regionserver.dns.interface</name>
	 <value>lo0</value>
	 </property>
	 <property>
	 <name>hbase.master.dns.interface</name>
	 <value>lo0</value>
	 </property>
	 EOS
	 end
	 def post_install
	 (var/"log/hbase").mkpath
	 (var/"run/hbase").mkpath
