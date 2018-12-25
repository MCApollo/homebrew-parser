name :
	 Clutter
homepage :
	 https://wiki.gnome.org/Projects/Clutter
url :
	 https://download.gnome.org/sources/clutter/1.26/clutter-1.26.2.tar.xz
description :
	 Generic high-level canvas library
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 atk
	 cairo
	 cogl
	 gdk-pixbuf
	 glib
	 json-glib
	 pango
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-debug
	 --prefix=#{prefix}
	 --enable-introspection=yes
	 --disable-silent-rules
	 --disable-Bsymbolic
	 --disable-examples
	 --disable-gtk-doc-html
	 --enable-gdk-pixbuf=yes
	 --without-x --enable-x11-backend=no
	 --enable-quartz-backend=yes
	 ]
	 system "./configure", *args
	 system "make", "install"
