name :
	 GtkChtheme
homepage :
	 http://plasmasturm.org/code/gtk-chtheme/
url :
	 http://plasmasturm.org/code/gtk-chtheme/gtk-chtheme-0.3.1.tar.bz2
description :
	 GTK+ 2.0 theme changer GUI
build_deps :
	 pkg-config
link_deps :
	 gettext
	 gtk+
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "Makefile", "-DGTK_DISABLE_DEPRECATED", ""
	 system "make", "PREFIX=#{prefix}", "install"
