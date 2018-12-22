name :
	 Jbake
homepage :
	 https://jbake.org/
url :
	 https://dl.bintray.com/jbake/binary/jbake-2.6.3-bin.zip
description :
	 Java based static site/blog generator
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"bin/jbake"
