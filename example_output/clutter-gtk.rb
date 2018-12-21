name :
	 ClutterGtk
homepage :
	 https://wiki.gnome.org/Projects/Clutter
url :
	 https://download.gnome.org/sources/clutter-gtk/1.8/clutter-gtk-1.8.4.tar.xz
description :
	 GTK+ integration library for Clutter
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 clutter
	 gdk-pixbuf
	 glib
	 gtk+3
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-debug
	 --prefix=#{prefix}
	 --enable-introspection=yes
	 --disable-silent-rules
	 --disable-gtk-doc-html
	 ]
	 system "./configure", *args
	 system "make", "install"
