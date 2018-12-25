name :
	 TomcatAT7
homepage :
	 https://tomcat.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=tomcat/tomcat-7/v7.0.92/bin/apache-tomcat-7.0.92.tar.gz
description :
	 Implementation of Java Servlet and JavaServer Pages
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
	 rm_rf Dir["bin/*.bat"]
	 prefix.install %w[NOTICE LICENSE RELEASE-NOTES RUNNING.txt]
	 libexec.install Dir["*"]
	 bin.install_symlink "#{libexec}/bin/catalina.sh" => "catalina"
