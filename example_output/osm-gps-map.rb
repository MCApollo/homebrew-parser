name :
	 OsmGpsMap
homepage :
	 https://nzjrs.github.com/osm-gps-map/
url :
	 https://github.com/nzjrs/osm-gps-map/releases/download/1.1.0/osm-gps-map-1.1.0.tar.gz
description :
	 GTK+ library to embed OpenStreetMap maps
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 gdk-pixbuf
	 glib
	 gtk+3
	 libsoup
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--disable-silent-rules", "--prefix=#{prefix}"
	 system "make", "install"
