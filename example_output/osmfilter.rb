name :
	 Osmfilter
homepage :
	 https://wiki.openstreetmap.org/wiki/Osmfilter
url :
	 https://gitlab.com/osm-c-tools/osmctools.git
description :
	 Command-line tool to filter OpenStreetMap files for specific tags
build_deps :
	 autoconf
	 automake
link_deps :
optional_deps :
conflicts :
resource :
	 ['pbf']
	 ['https://download.gisgraphy.com/openstreetmap/pbf/AD.tar.bz2']
patches :
EOF_patch :
install :
	 system "autoreconf", "-v", "-i"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
