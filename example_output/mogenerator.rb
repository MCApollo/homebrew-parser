name :
	 Mogenerator
homepage :
	 https://rentzsch.github.io/mogenerator/
url :
	 https://github.com/rentzsch/mogenerator/archive/1.31.tar.gz
description :
	 Generate Objective-C code for Core Data custom classes
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
	 xcodebuild "-target", "mogenerator", "-configuration", "Release", "SYMROOT=symroot", "OBJROOT=objroot"
	 bin.install "symroot/Release/mogenerator"
