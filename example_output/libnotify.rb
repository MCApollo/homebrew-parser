name :
	 Libnotify
homepage :
	 https://developer.gnome.org/libnotify
url :
	 https://download.gnome.org/sources/libnotify/0.7/libnotify-0.7.7.tar.xz
description :
	 Library that sends desktop notifications to a notification daemon
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 gdk-pixbuf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-tests",
	 "--enable-introspection"
	 system "make", "install"
