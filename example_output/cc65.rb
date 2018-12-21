name :
	 Cc65
homepage :
	 https://cc65.github.io/cc65/
url :
	 https://github.com/cc65/cc65/archive/V2.17.tar.gz
description :
	 6502 C compiler
build_deps :
link_deps :
conflicts :
	 grc
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}"
	 system "make", "install", "PREFIX=#{prefix}"
