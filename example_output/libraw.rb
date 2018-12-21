name :
	 Libraw
homepage :
	 https://www.libraw.org/
url :
	 https://www.libraw.org/data/LibRaw-0.19.0.tar.gz
description :
	 Library for reading RAW files from digital photo cameras
build_deps :
	 pkg-config
link_deps :
	 jasper
	 jpeg
	 little-cms2
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking"
	 system "make"
	 system "make", "install"
	 doc.install Dir["doc/*"]
	 prefix.install "samples"
