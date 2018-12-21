name :
	 Webarchiver
homepage :
	 https://github.com/newzealandpaul/webarchiver
url :
	 https://github.com/newzealandpaul/webarchiver/archive/0.9.tar.gz
description :
	 Allows you to create Safari .webarchive files
build_deps :
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "SYMROOT=build", "-arch", "x86_64"
	 bin.install "./build/Release/webarchiver"
