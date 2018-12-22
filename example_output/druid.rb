name :
	 Druid
homepage :
	 http://druid.io
url :
	 http://static.druid.io/artifacts/releases/druid-0.12.2-bin.tar.gz
description :
	 High-performance, column-oriented, distributed data store
build_deps :
link_deps :
	 :java
	 zookeeper
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 %w[
	 broker.sh
	 coordinator.sh
	 historical.sh
	 middleManager.sh
	 overlord.sh
	 ].each do |sh|
	 inreplace libexec/"bin/#{sh}", "./bin/node.sh", libexec/"bin/node.sh"
	 end
	 inreplace libexec/"bin/node.sh" do |s|
	 s.gsub! "nohup $JAVA", "nohup $JAVA -Ddruid.extensions.directory=\"#{libexec}/extensions\""
	 s.gsub! ":=lib", ":=#{libexec}/lib"
	 s.gsub! ":=conf/druid", ":=#{libexec}/conf/druid"
	 s.gsub! ":=log", ":=#{var}/druid/log"
	 s.gsub! ":=var/druid/pids", ":=#{var}/druid/pids"
	 end
	 if build.with? "mysql"
	 resource("mysql-metadata-storage").stage do
	 (libexec/"extensions/mysql-metadata-storage").install Dir["*"]
	 end
	 else
	 inreplace libexec/"conf/druid/_common/common.runtime.properties",
	 ", \"mysql-metadata-storage\"", ""
	 %w[
	 druid/hadoop-tmp
	 druid/indexing-logs
	 druid/log
	 druid/pids
	 druid/segments
	 druid/task
	 ].each do |dir|
	 (var/dir).mkpath
	 end
