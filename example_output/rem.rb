name :
	 Rem
homepage :
	 https://github.com/kykim/rem
url :
	 https://github.com/kykim/rem/archive/20150618.tar.gz
description :
	 Command-line tool to access OSX Reminders.app database
build_deps :
	 :xcode
link_deps :
conflicts :
	 remind
patches :
EOF_patch :
install :
	 xcodebuild "SYMROOT=build"
	 bin.install "build/Release/rem"
