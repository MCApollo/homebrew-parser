name :
	 UBootTools
homepage :
	 https://www.denx.de/wiki/U-Boot/
url :
	 http://ftp.denx.de/pub/u-boot/u-boot-2018.07.tar.bz2
description :
	 Universal boot loader
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "make", "sandbox_defconfig"
	 system "make", "tools"
	 bin.install "tools/mkimage"
	 bin.install "tools/dumpimage"
	 man1.install "doc/mkimage.1"
