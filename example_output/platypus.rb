name :
	 Platypus
homepage :
	 https://sveinbjorn.org/platypus
url :
	 https://sveinbjorn.org/files/software/platypus/platypus5.2.src.zip
description :
	 Create macOS applications from {Perl,Ruby,sh,Python} scripts
build_deps :
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "SYMROOT=build", "DSTROOT=#{buildpath}/dst",
	 "-project", "Platypus.xcodeproj",
	 "-target", "platypus",
	 "-target", "ScriptExec",
	 "clean",
	 "install"
	 man1.install "CommandLineTool/man/platypus.1"
	 bin.install "dst/platypus_clt" => "platypus"
	 cd "build/UninstalledProducts/macosx/ScriptExec.app/Contents" do
	 pkgshare.install "Resources/MainMenu.nib", "MacOS/ScriptExec"
