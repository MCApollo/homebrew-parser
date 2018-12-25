name :
	 Sourcery
homepage :
	 https://github.com/krzysztofzablocki/Sourcery
url :
	 https://github.com/krzysztofzablocki/Sourcery/archive/0.15.0.tar.gz
description :
	 Meta-programming for Swift, stop writing boilerplate code
build_deps :
link_deps :
	 :xcode
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
	 bin.install ".build/release/sourcery"
	 lib.install Dir[".build/release/*.dylib"]
