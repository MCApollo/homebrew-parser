name :
	 E2fsprogs
homepage :
	 https://e2fsprogs.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.44.3/e2fsprogs-1.44.3.tar.gz
description :
	 Utilities for the ext2, ext3, and ext4 file systems
build_deps :
	 pkg-config
link_deps :
	 gettext
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-e2initrd-helper"
	 system "make"
	 system "make", "install"
	 system "make", "install-libs"
