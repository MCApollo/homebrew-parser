name :
	 Gconf
homepage :
	 https://projects.gnome.org/gconf/
url :
	 https://download.gnome.org/sources/GConf/3.2/GConf-3.2.6.tar.xz
description :
	 System for storing user application preferences
build_deps :
	 intltool
	 pkg-config
link_deps :
	 dbus
	 dbus-glib
	 gettext
	 glib
	 orbit
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--disable-silent-rules", "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}"
	 system "make", "install"
	 rm lib/"gio/modules/giomodule.cache"
	 system Formula["glib"].opt_bin/"gio-querymodules", HOMEBREW_PREFIX/"lib/gio/modules"
