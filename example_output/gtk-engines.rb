name :
	 GtkEngines
homepage :
	 https://github.com/GNOME/gtk-engines
url :
	 https://download.gnome.org/sources/gtk-engines/2.20/gtk-engines-2.20.2.tar.bz2
description :
	 Themes for GTK+
build_deps :
	 intltool
	 pkg-config
link_deps :
	 cairo
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
