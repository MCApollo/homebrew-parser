name :
	 Goocanvas
homepage :
	 https://wiki.gnome.org/Projects/GooCanvas
url :
	 https://download.gnome.org/sources/goocanvas/2.0/goocanvas-2.0.4.tar.xz
description :
	 Canvas widget for GTK+ using the Cairo 2D library for drawing
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 cairo
	 glib
	 gtk+3
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--enable-introspection=yes",
	 "--disable-gtk-doc-html"
	 system "make", "install"
