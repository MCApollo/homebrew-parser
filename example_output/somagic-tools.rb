name :
	 SomagicTools
homepage :
	 https://code.google.com/archive/p/easycap-somagic-linux/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/easycap-somagic-linux/somagic-easycap-tools_1.1.tar.gz
description :
	 Tools to extract firmware from EasyCAP
build_deps :
link_deps :
	 libgcrypt
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "PREFIX=#{prefix}", "install"
