name :
	 Liquigraph
homepage :
	 https://www.liquigraph.org/
url :
	 https://github.com/liquigraph/liquigraph/archive/liquigraph-3.1.0.tar.gz
description :
	 Migration runner for Neo4j
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
	 system "mvn", "-B", "-q", "-am", "-pl", "liquigraph-cli", "clean", "package", "-DskipTests"
	 (buildpath/"binaries").mkpath
	 system "tar", "xzf", "liquigraph-cli/target/liquigraph-cli-bin.tar.gz", "-C", "binaries"
	 libexec.install "binaries/liquigraph-cli/liquigraph.sh"
	 libexec.install "binaries/liquigraph-cli/liquigraph-cli.jar"
	 (bin/"liquigraph").write_env_script libexec/"liquigraph.sh", Language::Java.java_home_env("1.8")
