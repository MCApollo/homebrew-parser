name :
	 Apktool
homepage :
	 https://github.com/iBotPeaches/Apktool
url :
	 https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.3.4.jar
description :
	 Tool for reverse engineering 3rd party, closed, binary Android apps
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "apktool_#{version}.jar"
	 bin.write_jar_script libexec/"apktool_#{version}.jar", "apktool"
