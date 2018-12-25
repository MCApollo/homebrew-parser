name :
	 Readosm
homepage :
	 https://www.gaia-gis.it/fossil/readosm/index
url :
	 https://www.gaia-gis.it/gaia-sins/readosm-1.1.0.tar.gz
description :
	 Extract valid data from an Open Street Map input file
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 doc.install "examples"
