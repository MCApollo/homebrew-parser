name :
	 Xcproj
homepage :
	 https://github.com/0xced/xcproj
url :
	 https://github.com/0xced/xcproj/archive/0.2.1.tar.gz
description :
	 Manipulate Xcode project files
build_deps :
link_deps :
	 :macos
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "-project", "xcproj.xcodeproj",
	 "-scheme", "xcproj",
	 "SYMROOT=build",
	 "DSTROOT=#{prefix}",
	 "INSTALL_PATH=/bin",
	 "-verbose",
	 "install"
