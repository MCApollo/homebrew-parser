name :
	 Ghex
homepage :
	 https://wiki.gnome.org/Apps/Ghex
url :
	 https://download.gnome.org/sources/ghex/3.18/ghex-3.18.3.tar.xz
description :
	 GNOME hex editor
build_deps :
	 intltool
	 itstool
	 libxml2
	 pkg-config
	 python@2
link_deps :
	 gtk+3
	 hicolor-icon-theme
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--disable-schemas-compile",
	 "--prefix=#{prefix}"
	 ENV.append_path "PYTHONPATH", "#{Formula["libxml2"].opt_lib}/python2.7/site-packages"
	 system "make", "install"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/hicolor"
