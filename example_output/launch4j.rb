name :
	 Launch4j
homepage :
	 https://launch4j.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/launch4j/launch4j-3/3.12/launch4j-3.12-macosx-x86.tgz
description :
	 Cross-platform Java executable wrapper
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"] - ["src", "web"]
	 bin.write_jar_script libexec/"launch4j.jar", "launch4j"
