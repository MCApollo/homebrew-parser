name :
	 ObjcCodegenutils
homepage :
	 https://github.com/square/objc-codegenutils
url :
	 https://github.com/square/objc-codegenutils/archive/v1.0.tar.gz
description :
	 Three small tools to help work with XCode
build_deps :
	 :xcode
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "-project", "codegenutils.xcodeproj", "-target", "assetgen", "-configuration", "Release", "SYMROOT=build", "OBJROOT=build"
	 bin.install "build/Release/objc-assetgen"
	 xcodebuild "-target", "colordump", "-configuration", "Release", "SYMROOT=build", "OBJROOT=build"
	 bin.install "build/Release/objc-colordump"
	 xcodebuild "-target", "identifierconstants", "-configuration", "Release", "SYMROOT=build", "OBJROOT=build"
	 bin.install "build/Release/objc-identifierconstants"
