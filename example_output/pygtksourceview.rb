name :
	 Pygtksourceview
homepage :
	 https://projects.gnome.org/gtksourceview/pygtksourceview.html
url :
	 https://download.gnome.org/sources/pygtksourceview/2.10/pygtksourceview-2.10.1.tar.bz2
description :
	 Python wrapper for the GtkSourceView widget library
build_deps :
	 pkg-config
link_deps :
	 gtk+
	 gtksourceview
	 pygtk
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-docs"
	 system "make", "install"
