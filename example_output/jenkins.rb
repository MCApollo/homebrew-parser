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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 system "mvn", "clean", "install", "-pl", "war", "-am", "-DskipTests"
	 else
	 system "jar", "xvf", "jenkins.war"
	 end
	 libexec.install Dir["**/jenkins.war", "**/jenkins-cli.jar"]
	 bin.write_jar_script libexec/"jenkins.war", "jenkins", :java_version => "1.8"
	 bin.write_jar_script libexec/"jenkins-cli.jar", "jenkins-cli", :java_version => "1.8"
