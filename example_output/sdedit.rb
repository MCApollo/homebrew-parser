name :
	 Sdedit
homepage :
	 https://sdedit.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/sdedit/sdedit/4.0/sdedit-4.01.jar
description :
	 Tool for generating sequence diagrams very quickly
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
	 libexec.install "sdedit-#{version}.jar"
	 bin.write_jar_script libexec/"sdedit-#{version}.jar", "sdedit"
