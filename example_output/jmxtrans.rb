name :
	 Jmxtrans
homepage :
	 https://github.com/jmxtrans/jmxtrans
url :
	 https://github.com/jmxtrans/jmxtrans/archive/jmxtrans-parent-270.tar.gz
description :
	 Tool to connect to JVMs and query their attributes
build_deps :
	 maven
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 cmd = Language::Java.java_home_cmd("1.8")
	 ENV["JAVA_HOME"] = Utils.popen_read(cmd).chomp
	 system "mvn", "package", "-DskipTests=true",
	 "-Dmaven.javadoc.skip=true",
	 "-Dcobertura.skip=true"
	 cd "jmxtrans" do
	 vers = Formula["jmxtrans"].version.to_s.split("-").last
	 inreplace "jmxtrans.sh", "lib/jmxtrans-all.jar",
	 libexec/"target/jmxtrans-#{vers}-all.jar"
	 chmod 0755, "jmxtrans.sh"
	 libexec.install %w[jmxtrans.sh target]
	 pkgshare.install %w[bin example.json src tools vagrant]
	 doc.install Dir["doc/*"]
