name :
	 Magnetix
homepage :
	 http://www.maczentrisch.de/magnetiX/
url :
	 http://www.maczentrisch.de/magnetiX/downloads/magnetiX_src.zip
description :
	 Interpreter for Magnetic Scrolls adventures
build_deps :
	 :xcode
link_deps :
	 :macos
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/4fe0b7b6c43f75738782e047606c07446db07c4f/magnetix/avfoundation.patch
EOF_patch :
install :
	 cd "magnetiX_src" do
	 xcodebuild "SYMROOT=build"
	 prefix.install "build/Default/magnetiX.app"
	 bin.write_exec_script "#{prefix}/magnetiX.app/Contents/MacOS/magnetiX"
