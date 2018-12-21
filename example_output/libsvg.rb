name :
	 Libsvg
homepage :
	 https://cairographics.org/
url :
	 https://cairographics.org/snapshots/libsvg-0.1.4.tar.gz
description :
	 Library for SVG files
build_deps :
	 pkg-config
link_deps :
	 jpeg
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
