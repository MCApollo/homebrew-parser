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
optional_deps :
conflicts :
resource :
	 ['mysql-metadata-storage']
	 ['http://static.druid.io/artifacts/releases/mysql-metadata-storage-0.12.2.tar.gz']
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
	 end
	 bin.install Dir["#{libexec}/bin/*.sh"]
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
	 Pathname.glob("#{bin}/*.sh") do |file|
	 mv file, bin/"druid-#{file.basename}"
	 end
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
