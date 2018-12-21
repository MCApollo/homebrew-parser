name :
	 Gif2png
homepage :
	 http://www.catb.org/~esr/gif2png/
url :
	 http://www.catb.org/~esr/gif2png/gif2png-2.5.11.tar.gz
description :
	 Convert GIFs to PNGs
build_deps :
link_deps :
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "prefix=#{prefix}"
