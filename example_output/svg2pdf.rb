name :
	 Svg2pdf
homepage :
	 https://cairographics.org/
url :
	 https://cairographics.org/snapshots/svg2pdf-0.1.3.tar.gz
description :
	 Renders SVG images to a PDF file (using Cairo)
build_deps :
	 pkg-config
link_deps :
	 libsvg-cairo
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
