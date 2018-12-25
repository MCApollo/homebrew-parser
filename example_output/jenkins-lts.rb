name :
	 JenkinsLts
homepage :
	 https://jenkins.io/index.html#stable
url :
	 http://mirrors.jenkins.io/war-stable/2.150.1/jenkins.war
description :
	 Extendable open-source CI server
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
	 system "jar", "xvf", "jenkins.war"
	 libexec.install "jenkins.war", "WEB-INF/jenkins-cli.jar"
	 bin.write_jar_script libexec/"jenkins.war", "jenkins-lts", :java_version => "1.8"
	 bin.write_jar_script libexec/"jenkins-cli.jar", "jenkins-lts-cli", :java_version => "1.8"
