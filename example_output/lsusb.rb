name :
	 Lsusb
homepage :
	 https://github.com/jlhonora/lsusb
url :
	 https://github.com/jlhonora/lsusb/releases/download/1.0/lsusb-1.0.tar.gz
description :
	 List USB devices, just like the Linux lsusb command
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "lsusb"
	 man8.install "man/lsusb.8"
