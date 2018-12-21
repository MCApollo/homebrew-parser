name :
	 Ext2fuse
homepage :
	 https://sourceforge.net/projects/ext2fuse
url :
	 https://downloads.sourceforge.net/project/ext2fuse/ext2fuse/0.8.1/ext2fuse-src-0.8.1.tar.gz
description :
	 Compact implementation of ext2 file system using FUSE
build_deps :
link_deps :
	 e2fsprogs
	 :osxfuse
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "LIBS", "-losxfuse"
	 ENV.append "CFLAGS", "-D__FreeBSD__=10 -DENABLE_SWAPFS -I/usr/local/include/osxfuse/fuse -I#{HOMEBREW_PREFIX}/opt/osxfuse/include/osxfuse/fuse"
	 ENV.append "CFLAGS", "--std=gnu89" if ENV.compiler == :clang
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
