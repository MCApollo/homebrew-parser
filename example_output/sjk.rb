name :
	 Sjk
homepage :
	 https://github.com/aragozin/jvm-tools
url :
	 https://search.maven.org/remotecontent?filepath=org/gridkit/jvmtool/sjk-plus/0.10.1/sjk-plus-0.10.1.jar
description :
	 Swiss Java Knife
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "sjk-plus-#{version}.jar"
	 bin.write_jar_script "#{libexec}/sjk-plus-#{version}.jar", "sjk"
