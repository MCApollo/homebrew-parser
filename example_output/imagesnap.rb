name :
	 Imagesnap
homepage :
	 https://iharder.sourceforge.io/current/macosx/imagesnap/
url :
	 https://github.com/rharder/imagesnap/archive/0.2.6.tar.gz
description :
	 Tool to capture still images from an iSight or other video source
build_deps :
	 :xcode
link_deps :
conflicts :
patches :
	 https://github.com/rharder/imagesnap/commit/cd33ff8963006c37170872a7bdd0f29a7eae9a29.patch?full_index=1
	 https://github.com/rharder/imagesnap/commit/c727968f278d09a792fd0dbbb19903c48518ba24.patch?full_index=1
EOF_patch :
install :
	 xcodebuild "-project", "ImageSnap.xcodeproj", "SYMROOT=build", "-sdk", MacOS.sdk_path
	 bin.install "build/Release/imagesnap"
