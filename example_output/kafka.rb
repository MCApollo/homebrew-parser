name :
	 Kafka
homepage :
	 https://kafka.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=/kafka/2.1.0/kafka_2.12-2.1.0.tgz
description :
	 Publish-subscribe messaging rethought as a distributed commit log
build_deps :
link_deps :
	 :java
	 zookeeper
conflicts :
patches :
EOF_patch :
install :
	 data = var/"lib"
	 inreplace "config/server.properties",
	 "log.dirs=/tmp/kafka-logs", "log.dirs=#{data}/kafka-logs"
	 inreplace "config/zookeeper.properties",
	 "dataDir=/tmp/zookeeper", "dataDir=#{data}/zookeeper"
	 rm_rf "bin/windows"
	 libexec.install "libs"
	 prefix.install "bin"
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
	 Dir["#{bin}/*.sh"].each { |f| mv f, f.to_s.gsub(/.sh$/, "") }
	 mv "config", "kafka"
	 etc.install "kafka"
	 libexec.install_symlink etc/"kafka" => "config"
	 (var+"log/kafka").mkpath
