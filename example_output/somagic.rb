name :
	 Somagic
homepage :
	 https://code.google.com/archive/p/easycap-somagic-linux/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/easycap-somagic-linux/somagic-easycap_1.1.tar.gz
description :
	 Linux capture program for the Somagic variants of EasyCAP
build_deps :
link_deps :
	 libgcrypt
	 libusb
	 somagic-tools
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "PREFIX=#{prefix}", "install"
