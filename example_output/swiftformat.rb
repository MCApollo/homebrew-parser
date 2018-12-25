name :
	 Swiftformat
homepage :
	 https://github.com/nicklockwood/SwiftFormat
url :
	 https://github.com/nicklockwood/SwiftFormat/archive/0.37.0.tar.gz
description :
	 Formatting tool for reformatting Swift code
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
	 "SwiftFormat.xcodeproj",
	 "-scheme", "SwiftFormat (Command Line Tool)",
	 "CODE_SIGN_IDENTITY=",
	 "SYMROOT=build", "OBJROOT=build"
	 bin.install "build/Release/swiftformat"
