name :
	 Apollo
homepage :
	 https://activemq.apache.org/apollo
url :
	 https://archive.apache.org/dist/activemq/activemq-apollo/1.7.1/apache-apollo-1.7.1-unix-distro.tar.gz
description :
	 Multi-protocol messaging broker based on ActiveMQ
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 ['bdb-je', 'mqtt']
	 ['https://download.oracle.com/maven/com/sleepycat/je/5.0.34/je-5.0.34.jar', 'https://search.maven.org/remotecontent?filepath=org/fusesource/fuse-extra/fusemq-apollo-mqtt/1.3/fusemq-apollo-mqtt-1.3-uber.jar']
patches :
EOF_patch :
install :
	 prefix.install_metafiles
	 prefix.install %w[docs examples]
	 libexec.install Dir["*"]
	 (libexec/"lib").install resource("bdb-je")
	 (libexec/"lib").install resource("mqtt")
	 (bin/"apollo").write_env_script libexec/"bin/apollo", Language::Java.java_home_env
