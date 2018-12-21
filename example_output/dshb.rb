name :
	 Dshb
homepage :
	 https://github.com/beltex/dshb
url :
	 https://github.com/beltex/dshb/releases/download/v0.2.0/dshb-0.2.0-source.zip
description :
	 macOS system monitor in Swift
build_deps :
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 system "make", "release"
	 bin.install "bin/dshb"
	 man1.install "docs/dshb.1"
