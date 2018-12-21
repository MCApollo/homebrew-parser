name :
	 SwitchaudioOsx
homepage :
	 https://github.com/deweller/switchaudio-osx/
url :
	 https://github.com/deweller/switchaudio-osx/archive/1.0.0.tar.gz
description :
	 Change macOS audio source from the command-line
build_deps :
	 :xcode
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "-project", "AudioSwitcher.xcodeproj",
	 "-target", "SwitchAudioSource",
	 "SYMROOT=build",
	 "-verbose",
	 "-arch", "x86_64",
	 "MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}"
	 prefix.install Dir["build/Release/*"]
	 bin.write_exec_script "#{prefix}/SwitchAudioSource"
	 chmod 0755, "#{bin}/SwitchAudioSource"
