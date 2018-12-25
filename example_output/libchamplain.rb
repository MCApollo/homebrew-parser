name :
	 Libchamplain
homepage :
	 https://wiki.gnome.org/Projects/libchamplain
url :
	 https://download.gnome.org/sources/libchamplain/0.12/libchamplain-0.12.16.tar.xz
description :
	 ClutterActor for displaying maps
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 clutter
	 clutter-gtk
	 gtk+3
	 libsoup
optional_deps :
	 vala
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
	 "--prefix=#{prefix}"
	 system "make", "install"
