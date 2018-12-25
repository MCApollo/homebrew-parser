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
optional_deps :
conflicts :
resource :
	 ['sample.apk']
	 ['https://github.com/downloads/stephanenicolas/RoboDemo/robodemo-sample-1.0.1.apk']
patches :
EOF_patch :
install :
	 libexec.install "apktool_#{version}.jar"
	 bin.write_jar_script libexec/"apktool_#{version}.jar", "apktool"
