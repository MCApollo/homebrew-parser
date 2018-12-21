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
	 hadoop
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.cmd", "conf/*.cmd"]
	 libexec.install %w[bin conf docs lib hbase-webapps]
	 %w[hbase start-hbase.sh stop-hbase.sh].each do |script|
	 (bin/script).write_env_script "#{libexec}/bin/#{script}", Language::Java.java_home_env("1.8")
	 (var/"log/hbase").mkpath
	 (var/"run/hbase").mkpath
