name :
	 DarkMode
homepage :
	 https://github.com/sindresorhus/dark-mode
url :
	 https://github.com/sindresorhus/dark-mode/archive/2.0.1.tar.gz
description :
	 Control the macOS dark mode from the command-line
build_deps :
	 :xcode
link_deps :
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./build"
	 bin.install "bin/dark-mode"
