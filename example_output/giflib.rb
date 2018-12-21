name :
	 Giflib
homepage :
	 https://giflib.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/giflib/giflib-5.1.4.tar.bz2
description :
	 Library and utilities for processing GIFs
build_deps :
link_deps :
conflicts :
patches :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/g/giflib/giflib_5.1.4-3.debian.tar.xz
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"
