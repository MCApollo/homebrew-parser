name :
	 TerminalNotifier
homepage :
	 https://github.com/julienXX/terminal-notifier
url :
	 https://github.com/julienXX/terminal-notifier/archive/2.0.0.tar.gz
description :
	 Send macOS User Notifications from the command-line
build_deps :
	 :xcode
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "-project", "Terminal Notifier.xcodeproj",
	 "-target", "terminal-notifier",
	 "SYMROOT=build",
	 "-verbose",
	 "CODE_SIGN_IDENTITY="
	 prefix.install "build/Release/terminal-notifier.app"
	 bin.write_exec_script prefix/"terminal-notifier.app/Contents/MacOS/terminal-notifier"
