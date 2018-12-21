name :
	 Nbimg
homepage :
	 https://github.com/poliva/nbimg
url :
	 https://github.com/poliva/nbimg/archive/v1.2.1.tar.gz
description :
	 Smartphone boot splash screen converter for Android and winCE
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile", "all: nbimg win32", "all: nbimg"
	 system "make", "prefix=#{prefix}",
	 "bindir=#{bin}",
	 "docdir=#{doc}",
	 "mandir=#{man}",
	 "install"
