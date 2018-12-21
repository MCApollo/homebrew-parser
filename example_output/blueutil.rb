name :
	 Blueutil
homepage :
	 https://github.com/toy/blueutil
url :
	 https://github.com/toy/blueutil/archive/v2.2.0.tar.gz
description :
	 Get/set bluetooth power and discoverable state
build_deps :
	 :xcode
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "SDKROOT=", "SYMROOT=build"
	 bin.install "build/Release/blueutil"
