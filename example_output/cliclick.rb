name :
	 Cliclick
homepage :
	 https://www.bluem.net/jump/cliclick/
url :
	 https://github.com/BlueM/cliclick/archive/4.0.1.tar.gz
description :
	 Tool for emulating mouse and keyboard events
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
	 system "make"
	 bin.install "cliclick"
