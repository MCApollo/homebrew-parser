name :
	 C2048
homepage :
	 https://github.com/mevdschee/2048.c
url :
	 578a5f314e1ce31b57e645a8c0a2c9d9d5539cde
description :
	 Console version of 2048
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "2048"
