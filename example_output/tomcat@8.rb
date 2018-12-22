name :
	 TomcatAT8
homepage :
	 https://tomcat.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz
description :
	 Implementation of Java Servlet and JavaServer Pages
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_rf Dir["bin/*.bat"]
	 prefix.install %w[NOTICE LICENSE RELEASE-NOTES RUNNING.txt]
	 libexec.install Dir["*"]
	 bin.install_symlink "#{libexec}/bin/catalina.sh" => "catalina"
