name :
	 Rswift
homepage :
	 https://github.com/mac-cain13/R.swift
url :
	 https://github.com/mac-cain13/R.swift.git
description :
	 Get strong typed, autocompleted resources like images, fonts and segues
build_deps :
link_deps :
	 :xcode
conflicts :
patches :
	 https://github.com/mac-cain13/R.swift/commit/082adb3a4fb3835507e61de15dabd2e9e1b547fb.diff?full_index=1
EOF_patch :
install :
	 system "swift", "build", "--disable-sandbox", "-c", "release", "-Xswiftc",
	 "-static-stdlib"
	 bin.install ".build/release/rswift"
