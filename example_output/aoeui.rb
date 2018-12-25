name :
	 Aoeui
homepage :
	 https://code.google.com/archive/p/aoeui/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/aoeui/aoeui-1.6.tgz
description :
	 Lightweight text editor optimized for Dvorak and QWERTY keyboards
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "INST_DIR=#{prefix}", "install"
