name :
	 Mas
homepage :
	 https://github.com/mas-cli/mas
url :
	 https://github.com/mas-cli/mas.git
description :
	 Mac App Store command-line interface
build_deps :
	 carthage
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 xcconfig = buildpath/"Overrides.xcconfig"
	 xcconfig.write <<~EOS
	 GCC_TREAT_WARNINGS_AS_ERRORS = NO
	 OTHER_LDFLAGS = -headerpad_max_install_names
	 EOS
	 ENV["XCODE_XCCONFIG_FILE"] = xcconfig
	 system "carthage", "bootstrap", "--platform", "macOS"
	 xcodebuild "install",
	 "-project", "mas-cli.xcodeproj",
	 "-scheme", "mas-cli Release",
	 "-configuration", "Release",
	 "OBJROOT=build",
	 "SYMROOT=build"
	 system "script/install", prefix
	 bash_completion.install "contrib/completion/mas-completion.bash" => "mas"
