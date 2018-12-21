name :
	 Pngpaste
homepage :
	 https://github.com/jcsalterego/pngpaste
url :
	 https://github.com/jcsalterego/pngpaste/archive/0.2.2.tar.gz
description :
	 Paste PNG into files
build_deps :
link_deps :
	 :xcode
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 system "make", "all"
	 bin.install "pngpaste"
