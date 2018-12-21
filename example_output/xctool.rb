name :
	 Xctool
homepage :
	 https://github.com/facebook/xctool
url :
	 https://github.com/facebook/xctool/archive/0.3.5.tar.gz
description :
	 Drop-in replacement for xcodebuild with a few extra features
build_deps :
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "-workspace", "xctool.xcworkspace",
	 "-scheme", "xctool",
	 "-configuration", "Release",
	 "SYMROOT=build",
	 "-IDEBuildLocationStyle=Custom",
	 "-IDECustomDerivedDataLocation=#{buildpath}",
	 "XT_INSTALL_ROOT=#{libexec}"
	 bin.install_symlink "#{libexec}/bin/xctool"
	 Dir.glob("#{libexec}/lib/*.dylib") do |lib_file|
	 system "/usr/bin/codesign", "-f", "-s", "-", lib_file
