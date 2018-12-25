name :
	 Wallpaper
homepage :
	 https://github.com/sindresorhus/macos-wallpaper
url :
	 https://github.com/sindresorhus/macos-wallpaper/archive/v2.0.0.tar.gz
description :
	 Manage the desktop wallpaper
build_deps :
link_deps :
	 :xcode
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "swift", "build", "-c", "release", "-Xswiftc", "-static-stdlib", "--disable-sandbox"
	 bin.install ".build/release/wallpaper"
