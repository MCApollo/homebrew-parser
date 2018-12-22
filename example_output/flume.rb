name :
	 Flume
homepage :
	 https://flume.apache.org
url :
	 https://www.apache.org/dyn/closer.cgi?path=flume/1.8.0/apache-flume-1.8.0-bin.tar.gz
description :
	 Hadoop-based distributed log collection and aggregation
build_deps :
link_deps :
	 hadoop
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.cmd", "bin/*.ps1"]
	 libexec.install %w[conf docs lib tools]
	 bin.install Dir["bin/*"]
	 bin.env_script_all_files(libexec/"bin",
	 Language::Java.java_home_env("1.7+").merge(:FLUME_HOME => libexec))
	 end
	 test do
	 assert_match "Flume #{version}", shell_output("#{bin}/flume-ng version")
	 end
