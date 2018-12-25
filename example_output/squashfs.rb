name :
	 Squashfs
homepage :
	 https://squashfs.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/squashfs/squashfs/squashfs4.3/squashfs4.3.tar.gz
description :
	 Compressed read-only file system for Linux
build_deps :
link_deps :
	 lzo
	 xz
optional_deps :
	 lz4
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/05ae0eb1/squashfs/squashfs-osx-bundle.diff
EOF_patch :
install :
	 args = %W[
	 XATTR_SUPPORT=0
	 EXTRA_CFLAGS=-std=gnu89
	 LZO_SUPPORT=1
	 LZO_DIR=#{Formula["lzo"].opt_prefix}
	 XZ_SUPPORT=1
	 XZ_DIR=#{Formula["xz"].opt_prefix}
	 LZMA_XZ_SUPPORT=1
	 ]
	 args << "LZ4_SUPPORT=1" if build.with? "lz4"
	 cd "squashfs-tools" do
	 system "make", *args
	 bin.install %w[mksquashfs unsquashfs]
	 end
	 doc.install %w[ACKNOWLEDGEMENTS INSTALL OLD-READMEs PERFORMANCE.README README-4.3]
