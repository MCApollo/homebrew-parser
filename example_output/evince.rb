name :
	 Evince
homepage :
	 https://wiki.gnome.org/Apps/Evince
url :
	 https://download.gnome.org/sources/evince/3.30/evince-3.30.2.tar.xz
description :
	 GNOME document viewer
build_deps :
	 gobject-introspection
	 intltool
	 itstool
	 pkg-config
link_deps :
	 adwaita-icon-theme
	 djvulibre
	 gspell
	 gtk+3
	 hicolor-icon-theme
	 libsecret
	 libspectre
	 libxml2
	 poppler
	 python@2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "configure", "AR_FLAGS=crD", "AR_FLAGS=r"
	 inreplace "data/Makefile.in", "gtk-update-icon-cache", "gtk3-update-icon-cache"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-nautilus",
	 "--disable-schemas-compile",
	 "--enable-introspection",
	 "--enable-djvu",
	 "--disable-browser-plugin"
	 ENV.append_path "PYTHONPATH", "#{Formula["libxml2"].opt_lib}/python2.7/site-packages"
	 system "make", "install"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/hicolor"
