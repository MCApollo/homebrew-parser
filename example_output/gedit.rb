name :
	 Gedit
homepage :
	 https://wiki.gnome.org/Apps/Gedit
url :
	 https://download.gnome.org/sources/gedit/3.30/gedit-3.30.2.tar.xz
description :
	 The GNOME text editor
build_deps :
	 intltool
	 itstool
	 pkg-config
	 vala
link_deps :
	 adwaita-icon-theme
	 atk
	 cairo
	 gdk-pixbuf
	 gettext
	 glib
	 gobject-introspection
	 gsettings-desktop-schemas
	 gspell
	 gtk+3
	 gtk-mac-integration
	 gtksourceview3
	 iso-codes
	 libpeas
	 libxml2
	 pango
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-updater",
	 "--disable-schemas-compile",
	 "--disable-python"
	 system "make", "install"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
