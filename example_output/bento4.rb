name :
	 Bento4
homepage :
	 https://www.bento4.com/
url :
	 https://github.com/axiomatic-systems/Bento4/archive/v1.5.1-624.tar.gz
description :
	 Full-featured MP4 format and MPEG DASH library and tools
build_deps :
	 :xcode
link_deps :
	 python
conflicts :
	 gpac
	 mp4v2
patches :
EOF_patch :
install :
	 cd "Build/Targets/universal-apple-macosx" do
	 xcodebuild "-target", "All", "-configuration", "Release", "SYMROOT=build"
	 programs = Dir["build/Release/*"].select do |f|
	 next if f.end_with? ".dylib"
	 next if f.end_with? "Test"
	 File.file?(f) && File.executable?(f)
