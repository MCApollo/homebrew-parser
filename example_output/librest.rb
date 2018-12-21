name :
	 Librest
homepage :
	 https://wiki.gnome.org/Projects/Librest
url :
	 https://download.gnome.org/sources/rest/0.8/rest-0.8.1.tar.xz
description :
	 Library to access RESTful web services
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 glib
	 libsoup
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--without-gnome",
	 "--without-ca-certificates",
	 "--enable-introspection=yes"
	 system "make", "install"
