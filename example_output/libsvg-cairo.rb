name :
	 LibsvgCairo
homepage :
	 https://cairographics.org/
url :
	 https://cairographics.org/snapshots/libsvg-cairo-0.1.6.tar.gz
description :
	 SVG rendering library using Cairo
build_deps :
	 pkg-config
link_deps :
	 cairo
	 libpng
	 libsvg
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--disable-debug",
	 "--prefix=#{prefix}"
	 system "make", "install"
