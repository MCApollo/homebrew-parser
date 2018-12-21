name :
	 Prips
homepage :
	 https://devel.ringlet.net/sysutils/prips/
url :
	 https://devel.ringlet.net/files/sys/prips/prips-1.1.0.tar.xz
description :
	 Print the IP addresses in a given range
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "prips"
	 man1.install "prips.1"
