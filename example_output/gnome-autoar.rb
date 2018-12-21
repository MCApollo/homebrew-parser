name :
	 GnomeAutoar
homepage :
	 https://github.com/GNOME/gnome-autoar
url :
	 https://download.gnome.org/sources/gnome-autoar/0.2/gnome-autoar-0.2.3.tar.xz
description :
	 GNOME library for archive handling
build_deps :
	 pkg-config
link_deps :
	 gtk+3
	 libarchive
conflicts :
patches :
EOF_patch :
install :
	 ENV.delete "SDKROOT"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-glibtest",
	 "--disable-schemas-compile"
	 system "make", "install"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
