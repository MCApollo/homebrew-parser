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
optional_deps :
conflicts :
resource :
	 ['librawtestfile']
	 ['https://www.rawsamples.ch/raws/nikon/d1/RAW_NIKON_D1.NEF']
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking"
	 system "make"
	 system "make", "install"
	 doc.install Dir["doc/*"]
	 prefix.install "samples"
