name :
	 Eject
homepage :
	 https://github.com/Raizlabs/Eject
url :
	 https://github.com/Raizlabs/Eject/archive/0.1.27.tar.gz
description :
	 Generate swift code from Interface Builder xibs
build_deps :
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "SYMROOT=build"
	 bin.install "build/Release/eject.app/Contents/MacOS/eject"
	 frameworks_path = "build/Release/eject.app/Contents/Frameworks"
	 mv frameworks_path, frameworks
