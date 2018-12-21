name :
	 Pillar
homepage :
	 https://github.com/comeara/pillar
url :
	 https://github.com/comeara/pillar/archive/v2.3.0.tar.gz
description :
	 Manage migrations for Cassandra data stores
build_deps :
	 sbt
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/main/bash/pillar" do |s|
	 s.gsub! "$JAVA ", "`/usr/libexec/java_home --version 1.8`/bin/java "
	 s.gsub! "${PILLAR_ROOT}/lib/pillar.jar", "#{libexec}/pillar-assembly-#{version}.jar"
	 s.gsub! "${PILLAR_ROOT}/conf", "#{etc}/pillar-log4j.properties"
