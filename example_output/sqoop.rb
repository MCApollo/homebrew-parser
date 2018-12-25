name :
	 Sqoop
homepage :
	 https://sqoop.apache.org/
url :
	 https://archive.apache.org/dist/sqoop/1.4.6/sqoop-1.4.6.bin__hadoop-2.0.4-alpha.tar.gz
description :
	 Transfer bulk data between Hadoop and structured datastores
build_deps :
link_deps :
	 coreutils
	 hadoop
	 hbase
	 hive
	 :java
	 zookeeper
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/77adf73/sqoop/1.4.6.patch
EOF_patch :
install :
	 libexec.install %w[bin conf lib]
	 libexec.install Dir["*.jar"]
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.6+"))
	 envs = libexec/"conf/sqoop-env.sh"
	 envs.write(sqoop_envs) unless envs.exist?
