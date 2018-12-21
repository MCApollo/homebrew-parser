name :
	 SimpleTiles
homepage :
	 https://propublica.github.io/simple-tiles/
url :
	 https://github.com/propublica/simple-tiles/archive/v0.6.1.tar.gz
description :
	 Image generation library for spatial data
build_deps :
	 pkg-config
link_deps :
	 cairo
	 gdal
	 pango
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
