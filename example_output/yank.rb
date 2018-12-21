name :
	 Yank
homepage :
	 https://github.com/mptre/yank
url :
	 https://github.com/mptre/yank/archive/v1.1.0.tar.gz
description :
	 Copy terminal output to clipboard
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}", "YANKCMD=pbcopy"
