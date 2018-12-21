name :
	 Sbjson
homepage :
	 https://github.com/stig/json-framework
url :
	 https://github.com/stig/json-framework/archive/v5.0.0.tar.gz
description :
	 JSON CLI parser & reformatter based on SBJson v5
build_deps :
	 :xcode
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "-project", "SBJson5.xcodeproj",
	 "-target", "sbjson",
	 "-configuration", "Release",
	 "clean",
	 "build",
	 "SYMROOT=build"
	 bin.install "build/Release/sbjson"
