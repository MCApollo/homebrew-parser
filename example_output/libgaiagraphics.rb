name :
	 Libgaiagraphics
homepage :
	 https://www.gaia-gis.it/fossil/libgaiagraphics/index
url :
	 https://www.gaia-gis.it/gaia-sins/gaiagraphics-sources/libgaiagraphics-0.5.tar.gz
description :
	 Library supporting common-utility raster handling
build_deps :
	 pkg-config
link_deps :
	 cairo
	 jpeg
	 libgeotiff
	 libpng
	 proj
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
