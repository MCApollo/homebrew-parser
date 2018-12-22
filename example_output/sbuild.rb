name :
	 Sbuild
homepage :
	 http://sbuild.org
url :
	 http://sbuild.org/uploads/sbuild/0.7.7/sbuild-0.7.7-dist.zip
description :
	 Scala-based build system
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 chmod 0755, libexec/"bin/sbuild"
	 bin.install_symlink libexec/"bin/sbuild"
