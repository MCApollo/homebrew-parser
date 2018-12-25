name :
	 Swimat
homepage :
	 https://github.com/Jintin/Swimat
url :
	 https://github.com/Jintin/Swimat/archive/v1.6.tar.gz
description :
	 Command-line tool to help format Swift code
build_deps :
link_deps :
	 :xcode
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 xcodebuild "-target", "CLI",
	 "-configuration", "Release",
	 "CODE_SIGN_IDENTITY=",
	 "SYMROOT=build"
	 bin.install "build/Release/swimat"
