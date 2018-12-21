name :
	 Gucharmap
homepage :
	 https://wiki.gnome.org/Apps/Gucharmap
url :
	 https://download.gnome.org/sources/gucharmap/11.0/gucharmap-11.0.3.tar.xz
description :
	 GNOME Character Map, based on the Unicode Character Database
build_deps :
	 coreutils
	 desktop-file-utils
	 intltool
	 itstool
	 pkg-config
link_deps :
	 gtk+3
conflicts :
patches :
EOF_patch :
install :
	 ENV["WGET"] = "curl"
	 ENV.append_path "PYTHONPATH", "#{Formula["libxml2"].opt_lib}/python2.7/site-packages"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-Bsymbolic",
	 "--disable-schemas-compile",
	 "--enable-introspection=no",
	 "--with-unicode-data=download"
	 system "make", "WGETFLAGS=--remote-name --remote-time --connect-timeout 30 --retry 8"
	 system "make", "install"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
