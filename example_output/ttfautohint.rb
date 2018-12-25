name :
	 Ttfautohint
homepage :
	 https://www.freetype.org/ttfautohint/
url :
	 https://downloads.sourceforge.net/project/freetype/ttfautohint/1.8.2/ttfautohint-1.8.2.tar.gz
description :
	 Auto-hinter for TrueType fonts
build_deps :
	 pkg-config
link_deps :
	 freetype
	 harfbuzz
	 libpng
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--without-doc",
	 "--without-qt"
	 system "make", "install"
