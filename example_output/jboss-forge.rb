name :
	 JbossForge
homepage :
	 https://forge.jboss.org/
url :
	 https://downloads.jboss.org/forge/releases/3.9.1.Final/forge-distribution-3.9.1.Final-offline.zip
description :
	 Tools to help set up and configure a project
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 libexec.install %w[addons bin lib logging.properties]
	 bin.install_symlink libexec/"bin/forge"
