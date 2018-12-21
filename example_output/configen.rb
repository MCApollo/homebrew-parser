name :
	 Configen
homepage :
	 https://github.com/theappbusiness/ConfigGenerator
url :
	 https://github.com/theappbusiness/ConfigGenerator/archive/v1.0.2.tar.gz
description :
	 Configuration file code generator for use in Xcode projects
build_deps :
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "SYMROOT=build"
	 bin.install "build/Release/configen"
