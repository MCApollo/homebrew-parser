name :
	 Spatialindex
homepage :
	 https://libspatialindex.github.io/
url :
	 https://download.osgeo.org/libspatialindex/spatialindex-src-1.8.5.tar.gz
description :
	 General framework for developing spatial indices
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
	 system "./configure", "--disable-debug", "--prefix=#{prefix}"
	 system "make", "install"
