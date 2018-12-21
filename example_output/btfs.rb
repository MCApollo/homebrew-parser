name :
	 Btfs
homepage :
	 https://github.com/johang/btfs
url :
	 https://github.com/johang/btfs/archive/v2.18.tar.gz
description :
	 BitTorrent filesystem based on FUSE
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 libtorrent-rasterbar
	 :osxfuse
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 inreplace "configure.ac", "fuse >= 2.8.0", "fuse >= 2.7.3"
	 system "autoreconf", "--force", "--install"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
