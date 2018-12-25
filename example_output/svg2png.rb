name :
	 Svg2png
homepage :
	 https://cairographics.org/
url :
	 https://cairographics.org/snapshots/svg2png-0.1.3.tar.gz
description :
	 SVG to PNG converter
build_deps :
	 pkg-config
link_deps :
	 libsvg-cairo
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
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
