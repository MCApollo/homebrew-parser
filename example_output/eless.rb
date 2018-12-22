name :
	 Eless
homepage :
	 https://eless.scripter.co/
url :
	 https://github.com/kaushalmodi/eless/archive/v0.5.tar.gz
description :
	 Better `less` using Emacs view-mode and Bash
build_deps :
link_deps :
	 emacs
conflicts :
patches :
EOF_patch :
install :
	 bin.install "eless"
	 info.install "docs/eless.info"
