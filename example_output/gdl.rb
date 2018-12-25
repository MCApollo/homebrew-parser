name :
	 Gdl
homepage :
	 https://developer.gnome.org/gdl/
url :
	 https://download.gnome.org/sources/gdl/3.28/gdl-3.28.0.tar.xz
description :
	 GNOME Docking Library provides docking features for GTK+ 3
build_deps :
	 gobject-introspection
	 intltool
	 pkg-config
link_deps :
	 gtk+3
	 libxml2
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
	 "--prefix=#{prefix}"
	 system "make", "install"
