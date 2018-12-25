name :
	 Irrlicht
homepage :
	 https://irrlicht.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/irrlicht/Irrlicht%20SDK/1.8/1.8.4/irrlicht-1.8.4.zip
description :
	 Realtime 3D engine
build_deps :
	 :xcode
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "source/Irrlicht/MacOSX/CIrrDeviceMacOSX.mm",
	 "[NSApp setDelegate:(id<NSFileManagerDelegate>)",
	 "[NSApp setDelegate:(id<NSApplicationDelegate>)"
	 xcodebuild "-project", "source/Irrlicht/MacOSX/MacOSX.xcodeproj",
	 "-configuration", "Release",
	 "-target", "libIrrlicht.a",
	 "SYMROOT=build"
	 lib.install "source/Irrlicht/MacOSX/build/Release/libIrrlicht.a"
	 include.install "include" => "irrlicht"
