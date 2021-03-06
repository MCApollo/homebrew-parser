name :
	 TomcatAT6
homepage :
	 https://tomcat.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=tomcat/tomcat-6/v6.0.53/bin/apache-tomcat-6.0.53.tar.gz
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
	 rm_rf Dir["bin/*.{cmd,bat]}"]
	 libexec.install Dir["*"]
	 (libexec+"logs").mkpath
	 bin.mkpath
	 Dir["#{libexec}/bin/*.sh"].each { |f| ln_s f, bin }
