name :
	 IosDeploy
homepage :
	 https://github.com/phonegap/ios-deploy
url :
	 https://github.com/ios-control/ios-deploy/archive/1.9.4.tar.gz
description :
	 Install and debug iPhone apps from the command-line
build_deps :
	 :xcode
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "-configuration", "Release", "SYMROOT=build"
	 xcodebuild "test", "-scheme", "ios-deploy-tests", "-configuration", "Release", "SYMROOT=build"
	 bin.install "build/Release/ios-deploy"
	 include.install "build/Release/libios_deploy.h"
	 lib.install "build/Release/libios-deploy.a"
