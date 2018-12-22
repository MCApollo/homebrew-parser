name :
	 Jenkins
homepage :
	 https://jenkins.io/
url :
	 http://mirrors.jenkins.io/war/2.155/jenkins.war
description :
	 Extendable open source continuous integration server
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 system "mvn", "clean", "install", "-pl", "war", "-am", "-DskipTests"
	 else
	 system "jar", "xvf", "jenkins.war"
