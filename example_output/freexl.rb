name :
	 Freexl
homepage :
	 https://www.gaia-gis.it/fossil/freexl/index
url :
	 https://www.gaia-gis.it/gaia-sins/freexl-sources/freexl-1.0.5.tar.gz
description :
	 Library to extract data from Excel .xls files
build_deps :
	 doxygen
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}",
	 "--disable-silent-rules"
	 system "make", "check"
	 system "make", "install"
	 system "doxygen"
	 doc.install "html"
