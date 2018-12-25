name :
	 Gtksourceview3
homepage :
	 https://projects.gnome.org/gtksourceview/
url :
	 https://download.gnome.org/sources/gtksourceview/3.24/gtksourceview-3.24.9.tar.xz
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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--enable-vala=yes",
	 "--enable-introspection=yes",
	 "--prefix=#{prefix}"
	 system "make", "install"
