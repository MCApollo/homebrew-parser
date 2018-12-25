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
optional_deps :
conflicts :
	 gpac
	 mp4v2
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd "Build/Targets/universal-apple-macosx" do
	 xcodebuild "-target", "All", "-configuration", "Release", "SYMROOT=build"
	 programs = Dir["build/Release/*"].select do |f|
	 next if f.end_with? ".dylib"
	 next if f.end_with? "Test"
	 File.file?(f) && File.executable?(f)
	 end
	 bin.install programs
	 end
	 rm Dir["Source/Python/wrappers/*.bat"]
	 inreplace Dir["Source/Python/wrappers/*"],
	 "BASEDIR=$(dirname $0)", "BASEDIR=#{libexec}/Python/wrappers"
	 libexec.install "Source/Python"
	 bin.install_symlink Dir[libexec/"Python/wrappers/*"]
