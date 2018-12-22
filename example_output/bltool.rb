name :
	 Bltool
homepage :
	 https://github.com/ToxicFrog/bltool
url :
	 https://github.com/ToxicFrog/bltool/releases/download/v0.2.4/bltool-0.2.4.zip
description :
	 Tool for command-line interaction with backloggery.com
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 system "lein", "uberjar"
	 bltool_jar = Dir["target/bltool-*-standalone.jar"][0]
	 else
	 bltool_jar = "bltool.jar"
