name :
	 Jasmin
homepage :
	 https://jasmin.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/jasmin/jasmin/jasmin-2.4/jasmin-2.4.zip
description :
	 Assembler for the Java Virtual Machine
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_rf Dir["*.bat"]
	 libexec.install Dir["*.jar"]
	 prefix.install %w[Readme.txt license-ant.txt license-jasmin.txt]
	 bin.write_jar_script libexec/"jasmin.jar", "jasmin"
