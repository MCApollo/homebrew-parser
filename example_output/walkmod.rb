name :
	 Walkmod
homepage :
	 http://www.walkmod.com
url :
	 https://bitbucket.org/rpau/walkmod/downloads/walkmod-3.0.0-installer.zip
description :
	 Java-based open source tool to apply and share code conventions
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
	 libexec.install Dir["*"]
	 bin.install_symlink libexec+"bin/walkmod"
