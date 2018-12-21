name :
	 Lm4tools
homepage :
	 https://github.com/utzig/lm4tools
url :
	 https://github.com/utzig/lm4tools/archive/v0.1.3.tar.gz
description :
	 Tools for TI Stellaris Launchpad boards
build_deps :
	 pkg-config
link_deps :
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
