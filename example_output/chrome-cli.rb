name :
	 ChromeCli
homepage :
	 https://github.com/prasmussen/chrome-cli
url :
	 https://github.com/prasmussen/chrome-cli/archive/1.6.0.tar.gz
description :
	 Control Google Chrome from the command-line
build_deps :
	 :xcode
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "SDKROOT=", "SYMROOT=build"
	 bin.install "build/Release/chrome-cli"
	 rm_rf "build"
	 inreplace "chrome-cli/App.m", "com.google.Chrome", "com.google.Chrome.canary"
	 xcodebuild "SDKROOT=", "SYMROOT=build"
	 bin.install "build/Release/chrome-cli" => "chrome-canary-cli"
	 rm_rf "build"
	 inreplace "chrome-cli/App.m", "com.google.Chrome.canary", "org.Chromium.chromium"
	 xcodebuild "SDKROOT=", "SYMROOT=build"
	 bin.install "build/Release/chrome-cli" => "chromium-cli"
