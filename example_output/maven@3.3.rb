name :
	 MavenAT33
homepage :
	 https://maven.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
description :
	 Java-based project management
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.cmd"]
	 chmod 0644, "conf/settings.xml"
	 libexec.install Dir["*"]
	 Pathname.glob("#{libexec}/bin/*") do |file|
	 next if file.directory?
	 basename = file.basename
	 next if basename.to_s == "m2.conf"
	 (bin/basename).write_env_script file, Language::Java.overridable_java_home_env
	 end
