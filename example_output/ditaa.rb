name :
	 Ditaa
homepage :
	 https://ditaa.sourceforge.io/
url :
	 https://github.com/stathissideris/ditaa/releases/download/v0.11.0/ditaa-0.11.0-standalone.jar
description :
	 Convert ASCII diagrams into proper bitmap graphics
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
	 libexec.install "ditaa-#{version}-standalone.jar"
	 bin.write_jar_script libexec/"ditaa-#{version}-standalone.jar", "ditaa"
