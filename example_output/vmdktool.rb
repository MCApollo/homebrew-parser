name :
	 Vmdktool
homepage :
	 https://manned.org/vmdktool
url :
	 https://people.freebsd.org/~brian/vmdktool/vmdktool-1.4.tar.gz
description :
	 Converts raw filesystems to VMDK files and vice versa
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
	 system "make", "CFLAGS='-D_GNU_SOURCE -g -O -pipe'"
	 bin.mkpath
	 man8.mkpath
	 inreplace "Makefile", "man/man8", "share/man/man8"
	 system "make", "install", "PREFIX=#{prefix}"
