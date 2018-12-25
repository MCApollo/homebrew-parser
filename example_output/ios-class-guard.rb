name :
	 IosClassGuard
homepage :
	 https://github.com/Polidea/ios-class-guard/
url :
	 https://github.com/Polidea/ios-class-guard/archive/0.8.tar.gz
description :
	 Objective-C obfuscator for Mach-O executables
build_deps :
	 :xcode
link_deps :
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 xcodebuild "-workspace", "ios-class-guard.xcworkspace",
	 "-scheme", "ios-class-guard",
	 "-configuration", "Release",
	 "SYMROOT=build", "PREFIX=#{prefix}", "ONLY_ACTIVE_ARCH=YES"
	 bin.install "build/Release/ios-class-guard"
