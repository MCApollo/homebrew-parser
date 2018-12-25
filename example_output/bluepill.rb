name :
	 Bluepill
homepage :
	 https://github.com/linkedin/bluepill
url :
	 https://github.com/linkedin/bluepill/archive/v3.1.1.tar.gz
description :
	 iOS testing tool that runs UI tests using multiple simulators
build_deps :
link_deps :
	 :xcode
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 xcodebuild "-workspace", "Bluepill.xcworkspace",
	 "-scheme", "bluepill",
	 "-configuration", "Release",
	 "SYMROOT=../"
	 bin.install "Release/bluepill", "Release/bp"
