name :
	 GeocodeGlib
homepage :
	 https://developer.gnome.org/geocode-glib
url :
	 https://download.gnome.org/sources/geocode-glib/3.24/geocode-glib-3.24.0.tar.xz
description :
	 GNOME library for gecoding and reverse geocoding
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 gtk+3
	 json-glib
	 libsoup
conflicts :
patches :
EOF_patch :
install :
	 inreplace "icons/Makefile.in", "gtk-update-icon-cache", "gtk3-update-icon-cache"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 rm share/"icons/gnome/icon-theme.cache"
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/gnome"
