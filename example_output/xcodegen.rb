name :
	 Xcodegen
homepage :
	 https://github.com/yonaskolb/XcodeGen
url :
	 https://github.com/yonaskolb/XcodeGen/archive/2.0.0.tar.gz
description :
	 Generate your Xcode project from a spec file and your folder structure
build_deps :
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
