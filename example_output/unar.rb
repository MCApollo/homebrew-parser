name :
	 Unar
homepage :
	 https://unarchiver.c3.cx/commandline
url :
	 https://wakaba.c3.cx/releases/TheUnarchiver/unar1.10.1_src.zip
description :
	 Command-line unarchiving tools supporting multiple formats
build_deps :
	 :xcode
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/a94f6f/unar/xcode10.diff
EOF_patch :
install :
	 mv Dir["The Unarchiver/*"], "."
	 args = %W[
	 -project ./XADMaster/XADMaster.xcodeproj
	 SYMROOT=..
	 -configuration Release
	 MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}
	 ]
	 xcodebuild "-target", "XADMaster", *args
	 xcodebuild "-target", "unar", *args
	 xcodebuild "-target", "lsar", *args
	 bin.install "./Release/unar", "./Release/lsar"
	 lib.install "./Release/libXADMaster.a"
	 frameworks.install "./Release/XADMaster.framework"
	 (include/"libXADMaster").install_symlink Dir["#{frameworks}/XADMaster.framework/Headers/*"]
	 cd "./Extra" do
	 man1.install "lsar.1", "unar.1"
	 bash_completion.install "unar.bash_completion", "lsar.bash_completion"
	 end
