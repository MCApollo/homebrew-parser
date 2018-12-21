name :
	 Amtk
homepage :
	 https://wiki.gnome.org/Projects/Amtk
url :
	 https://download.gnome.org/sources/amtk/5.0/amtk-5.0.0.tar.xz
description :
	 Actions, Menus and Toolbars Kit for GNOME
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 gtk+3
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
