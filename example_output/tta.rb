name :
	 Tta
homepage :
	 https://web.archive.org/web/20100131140204/true-audio.com/
url :
	 https://downloads.sourceforge.net/project/tta/tta/libtta/libtta-2.2.tar.gz
description :
	 Lossless audio codec
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--enable-sse4"
	 system "make", "install"
