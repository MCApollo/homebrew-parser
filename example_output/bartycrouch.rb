name :
	 Bartycrouch
homepage :
	 https://github.com/Flinesoft/BartyCrouch
url :
	 https://github.com/Flinesoft/BartyCrouch/archive/3.13.1.tar.gz
description :
	 Incrementally update your Strings files
build_deps :
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "-project", "BartyCrouch.xcodeproj",
	 "-scheme", "BartyCrouch CLI",
	 "SYMROOT=build",
	 "DSTROOT=#{prefix}",
	 "INSTALL_PATH=/bin",
	 "-verbose",
	 "install"
