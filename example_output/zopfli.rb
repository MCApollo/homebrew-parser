name :
	 Zopfli
homepage :
	 https://github.com/google/zopfli
url :
	 https://github.com/google/zopfli/archive/zopfli-1.0.2.tar.gz
description :
	 New zlib (gzip, deflate) compatible compressor
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "zopfli", "zopflipng"
	 bin.install "zopfli", "zopflipng"
