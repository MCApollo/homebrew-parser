name :
	 Squashfuse
homepage :
	 https://github.com/vasi/squashfuse
url :
	 https://github.com/vasi/squashfuse/releases/download/0.1.103/squashfuse-0.1.103.tar.gz
description :
	 FUSE filesystem to mount squashfs archives
build_deps :
	 pkg-config
link_deps :
	 lz4
	 lzo
	 :osxfuse
	 squashfs
	 xz
	 zstd
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
