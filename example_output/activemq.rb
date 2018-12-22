name :
	 Activemq
homepage :
	 https://activemq.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=/activemq/5.15.8/apache-activemq-5.15.8-bin.tar.gz
description :
	 Apache ActiveMQ: powerful open source messaging server
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_rf Dir["bin/linux-x86-*"]
	 libexec.install Dir["*"]
	 (bin/"activemq").write_env_script libexec/"bin/activemq", Language::Java.java_home_env("1.6+")
