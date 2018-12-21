name :
	 Xz
homepage :
	 https://tukaani.org/xz/
url :
	 https://downloads.sourceforge.net/project/lzmautils/xz-5.2.4.tar.gz
description :
	 General-purpose data compression with high compression ratio
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
	 system "make", "check"
	 system "make", "install"
