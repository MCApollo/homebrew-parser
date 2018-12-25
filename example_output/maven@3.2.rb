name :
	 MavenAT32
homepage :
	 https://maven.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
description :
	 Java-based project management
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 chmod 0644, "conf/settings.xml"
	 prefix.install_metafiles
	 libexec.install Dir["*"]
	 Pathname.glob("#{libexec}/bin/*") do |file|
	 next if file.directory?
	 basename = file.basename
	 next if basename.to_s == "m2.conf"
	 (bin/basename).write_env_script file, Language::Java.overridable_java_home_env
	 end
