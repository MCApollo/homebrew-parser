name :
	 Swiftplate
homepage :
	 https://github.com/JohnSundell/SwiftPlate
url :
	 https://github.com/JohnSundell/SwiftPlate/archive/1.4.0.tar.gz
description :
	 Cross-platform Swift framework templates from the command-line
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
	 xcodebuild "-project",
	 "SwiftPlate.xcodeproj",
	 "-scheme", "SwiftPlate",
	 "-configuration", "Release",
	 "CONFIGURATION_BUILD_DIR=build",
	 "SYMROOT=."
	 bin.install "build/swiftplate"
