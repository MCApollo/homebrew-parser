name :
	 Libgda
homepage :
	 http://www.gnome-db.org/
url :
	 https://download.gnome.org/sources/libgda/5.2/libgda-5.2.8.tar.xz
description :
	 Provides unified data access to the GNOME project
build_deps :
	 gobject-introspection
	 intltool
	 itstool
	 pkg-config
link_deps :
	 gettext
	 glib
	 libgcrypt
	 libgee
	 openssl
	 readline
	 sqlite
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
	 "--prefix=#{prefix}",
	 "--disable-binreloc",
	 "--disable-gtk-doc",
	 "--without-java",
	 "--enable-introspection"
	 system "make"
	 system "make", "install"
