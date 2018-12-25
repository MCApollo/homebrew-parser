name :
	 Bdsup2sub
homepage :
	 https://github.com/mjuhasz/BDSup2Sub
url :
	 https://github.com/mjuhasz/BDSup2Sub/archive/5.1.2.tar.gz
description :
	 Convert and tweak bitmap based subtitle streams
build_deps :
	 maven
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 ['macify', 'java-image-scaling']
	 ['https://www.java2s.com/Code/JarDownload/macify/macify-1.4.jar.zip', 'https://www.java2s.com/Code/JarDownload/java-image/java-image-scaling-0.8.5.jar.zip']
patches :
EOF_patch :
install :
	 mkdir (buildpath/"repo")
	 (buildpath/"repo").install resource("macify")
	 inreplace "pom.xml", "macify</groupId>", "macify</groupId>\n<scope>system</scope>\n<systemPath>${project.basedir}/repo/macify-1.4.jar</systemPath>"
	 inreplace "pom.xml", %r{<repositories>(.|\n)+</repositories>}, ""
	 (buildpath/"repo").install resource("java-image-scaling")
	 inreplace "pom.xml", "java-image-scaling</artifactId>",
	 "java-image-scaling</artifactId>\n<scope>system</scope>\n<systemPath>${project.basedir}/repo/java-image-scaling-0.8.5.jar</systemPath>"
	 inreplace "pom.xml", "</properties>",
	 "<maven.compiler.source>1.6</maven.compiler.source><maven.compiler.target>1.6</maven.compiler.target></properties>"
	 system "mvn", "clean", "package", "-DskipTests"
	 libexec.install "target/BDSup2Sub-#{version}-jar-with-dependencies.jar"
	 bin.write_jar_script(libexec/"BDSup2Sub-#{version}-jar-with-dependencies.jar", "BDSup2Sub")
