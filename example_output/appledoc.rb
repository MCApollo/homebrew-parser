name :
	 Appledoc
homepage :
	 http://appledoc.gentlebytes.com/
url :
	 https://github.com/tomaz/appledoc/archive/2.2.1.tar.gz
description :
	 Objective-C API documentation generator
build_deps :
	 :xcode
link_deps :
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 xcodebuild "-project", "appledoc.xcodeproj",
	 "-target", "appledoc",
	 "-configuration", "Release",
	 "clean", "install",
	 "SYMROOT=build",
	 "DSTROOT=build",
	 "INSTALL_PATH=/bin",
	 "OTHER_CFLAGS='-DCOMPILE_TIME_DEFAULT_TEMPLATE_PATH=@\"#{prefix}/Templates\"'"
	 bin.install "build/bin/appledoc"
	 prefix.install "Templates/"
