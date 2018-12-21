name :
	 Osxutils
homepage :
	 https://github.com/specious/osxutils
url :
	 https://github.com/specious/osxutils/archive/v1.9.0.tar.gz
description :
	 Collection of macOS command-line utilities
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "PREFIX=#{prefix}", "install"
