name :
	 Genext2fs
homepage :
	 https://genext2fs.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/genext2fs/genext2fs/1.4.1/genext2fs-1.4.1.tar.gz
description :
	 Generates an ext2 filesystem as a normal (non-root) user
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
