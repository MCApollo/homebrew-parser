name :
	 E2tools
homepage :
	 http://home.earthlink.net/~k_sheff/sw/e2tools/
url :
	 http://home.earthlink.net/~k_sheff/sw/e2tools/e2tools-0.0.16.tar.gz
description :
	 Utilities to read, write, and manipulate files in ext2/3/4 filesystems
build_deps :
link_deps :
	 e2fsprogs
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
