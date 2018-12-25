name :
	 ChooseGui
homepage :
	 https://github.com/sdegutis/choose
url :
	 https://github.com/sdegutis/choose/archive/1.0.tar.gz
description :
	 Fuzzy matcher that uses std{in,out} and a native GUI
build_deps :
	 :xcode
link_deps :
	 :macos
optional_deps :
conflicts :
	 choose
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 xcodebuild "SDKROOT=", "SYMROOT=build"
	 bin.install "build/Release/choose"
