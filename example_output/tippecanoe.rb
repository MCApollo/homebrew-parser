name :
	 Tippecanoe
homepage :
	 https://github.com/mapbox/tippecanoe
url :
	 https://github.com/mapbox/tippecanoe/archive/1.32.5.tar.gz
description :
	 Build vector tilesets from collections of GeoJSON features
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
	 system "make"
	 system "make", "install", "PREFIX=#{prefix}"
