name :
	 Libgnomecanvas
homepage :
	 https://developer.gnome.org/libgnomecanvas/2.30/
url :
	 https://download.gnome.org/sources/libgnomecanvas/2.30/libgnomecanvas-2.30.3.tar.bz2
description :
	 Highlevel, structured graphics library
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 gtk+
	 libart
	 libglade
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-static",
	 "--prefix=#{prefix}",
	 "--enable-glade"
	 system "make", "install"
