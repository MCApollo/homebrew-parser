name :
	 Sonarqube
homepage :
	 https://www.sonarqube.org/
url :
	 https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.4.zip
description :
	 Manage code quality
build_deps :
link_deps :
	 :java
conflicts :
	 sonarqube-lts
patches :
EOF_patch :
install :
	 rm_rf Dir["bin/{linux,windows}-*"]
	 libexec.install Dir["*"]
	 bin.install_symlink "#{libexec}/bin/macosx-universal-64/sonar.sh" => "sonar"
