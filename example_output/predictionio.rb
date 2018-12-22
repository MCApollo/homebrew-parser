name :
	 Predictionio
homepage :
	 https://predictionio.incubator.apache.org/
url :
	 https://github.com/apache/incubator-predictionio/releases/download/v0.9.6/PredictionIO-0.9.6.tar.gz
description :
	 Source machine learning server
build_deps :
link_deps :
	 apache-spark
	 elasticsearch
	 hadoop
	 hbase
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 libexec.install Dir["*"]
	 bin.write_exec_script libexec/"bin/pio"
	 inreplace libexec/"conf/pio-env.sh" do |s|
	 s.gsub! /#\s*ES_CONF_DIR=.+$/, "ES_CONF_DIR=#{Formula["elasticsearch"].opt_prefix}/config"
	 s.gsub! /SPARK_HOME=.+$/, "SPARK_HOME=#{Formula["apache-spark"].opt_prefix}"
	 end
