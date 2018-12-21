name :
	 Gtksourceview4
homepage :
	 https://projects.gnome.org/gtksourceview/
url :
	 https://download.gnome.org/sources/gtksourceview/4.0/gtksourceview-4.0.3.tar.xz
description :
	 Text view with syntax, undo/redo, and text marks
build_deps :
	 gobject-introspection
	 intltool
	 pkg-config
	 vala
link_deps :
	 gettext
	 gtk+3
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-vala=yes",
	 "--enable-gobject-introspection=yes"
	 system "make", "install"
