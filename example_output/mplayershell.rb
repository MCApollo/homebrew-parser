name :
	 Mplayershell
homepage :
	 https://github.com/donmelton/MPlayerShell
url :
	 https://github.com/donmelton/MPlayerShell/archive/0.9.3.tar.gz
description :
	 Improved visual experience for MPlayer on macOS
build_deps :
	 :xcode
link_deps :
	 :macos
	 mplayer
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 xcodebuild "-project",
	 "MPlayerShell.xcodeproj",
	 "-target", "mps",
	 "-configuration", "Release",
	 "clean", "build",
	 "SYMROOT=build",
	 "DSTROOT=build"
	 bin.install "build/Release/mps"
	 man1.install "Source/mps.1"
