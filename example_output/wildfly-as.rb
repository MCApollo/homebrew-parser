name :
	 WildflyAs
homepage :
	 http://wildfly.org/
url :
	 https://download.jboss.org/wildfly/14.0.0.Final/wildfly-14.0.0.Final.tar.gz
description :
	 Managed application runtime for building applications
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
	 rm_f Dir["bin/*.bat"]
	 rm_f Dir["bin/*.ps1"]
	 libexec.install Dir["*"]
	 mkdir_p libexec/"standalone/log"
