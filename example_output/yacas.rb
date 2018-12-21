name :
	 Yacas
homepage :
	 https://www.yacas.org/
url :
	 https://github.com/grzegorzmazur/yacas/archive/v1.6.1.tar.gz
description :
	 General purpose computer algebra system
build_deps :
	 cmake
	 :xcode
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-G", "Xcode", "-DENABLE_CYACAS_GUI=OFF",
	 "-DENABLE_CYACAS_KERNEL=OFF", *std_cmake_args
	 xcodebuild "-target", "ALL_BUILD", "-project", "YACAS.xcodeproj",
	 "-configuration", "Release", "SYMROOT=build/cyacas/libyacas"
