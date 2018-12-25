name :
	 Picocom
homepage :
	 https://github.com/npat-efault/picocom
url :
	 https://github.com/npat-efault/picocom/archive/3.1.tar.gz
description :
	 Minimal dumb-terminal emulation program
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
	 bin.install "picocom"
	 man1.install "picocom.1"
