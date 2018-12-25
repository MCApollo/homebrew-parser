name :
	 Glassfish
homepage :
	 https://glassfish.java.net/
url :
	 https://download.oracle.com/glassfish/5.0/release/glassfish-5.0.zip
description :
	 Java EE application server
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
	 payara
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_rf Dir["bin/*.bat"]
	 libexec.install Dir["*", ".org.opensolaris,pkg"]
	 bin.install_symlink Dir["#{libexec}/bin/*"]
