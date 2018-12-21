name :
	 GsettingsDesktopSchemas
homepage :
	 https://download.gnome.org/sources/gsettings-desktop-schemas/
url :
	 https://download.gnome.org/sources/gsettings-desktop-schemas/3.28/gsettings-desktop-schemas-3.28.1.tar.xz
description :
	 GSettings schemas for desktop components
build_deps :
	 gobject-introspection
	 intltool
	 pkg-config
link_deps :
	 gettext
	 glib
	 libffi
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-schemas-compile",
	 "--enable-introspection=yes"
	 system "make", "install"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
