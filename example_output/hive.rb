name :
	 Hive
homepage :
	 https://hive.apache.org
url :
	 https://www.apache.org/dyn/closer.cgi?path=hive/hive-3.1.1/apache-hive-3.1.1-bin.tar.gz
description :
	 Hadoop-based data summarization, query, and analysis
build_deps :
link_deps :
	 hadoop
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.cmd", "bin/ext/*.cmd", "bin/ext/util/*.cmd"]
	 libexec.install %w[bin conf examples hcatalog lib scripts]
	 Pathname.glob("#{libexec}/bin/*") do |file|
	 next if file.directory?
	 (bin/file.basename).write_env_script file,
	 Language::Java.java_home_env("1.7+").merge(:HIVE_HOME => libexec)
	 end
