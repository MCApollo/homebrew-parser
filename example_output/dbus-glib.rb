name :
	 DbusGlib
homepage :
	 https://wiki.freedesktop.org/www/Software/DBusBindings/
url :
	 https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.110.tar.gz
description :
	 GLib bindings for the D-Bus message bus system
build_deps :
	 pkg-config
link_deps :
	 dbus
	 gettext
	 glib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
