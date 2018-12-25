name :
	 Natalie
homepage :
	 https://github.com/krzyzanowskim/Natalie
url :
	 https://github.com/krzyzanowskim/Natalie/archive/0.7.0.tar.gz
description :
	 Storyboard Code Generator (for Swift)
build_deps :
link_deps :
	 :xcode
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "swift", "build", "--disable-sandbox", "-c", "release", "-Xswiftc",
	 "-static-stdlib"
	 bin.install ".build/release/natalie"
	 share.install "NatalieExample"
