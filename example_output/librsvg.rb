name :
	 Librsvg
homepage :
	 https://wiki.gnome.org/Projects/LibRsvg
url :
	 https://download.gnome.org/sources/librsvg/2.44/librsvg-2.44.10.tar.xz
description :
	 Library to render SVG files using Cairo
build_deps :
	 gobject-introspection
	 pkg-config
	 rust
link_deps :
	 cairo
	 gdk-pixbuf
	 glib
	 libcroco
	 pango
	 gtk+3
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --disable-Bsymbolic
	 --enable-tools=yes
	 --enable-pixbuf-loader=yes
	 --enable-introspection=yes
	 ]
	 system "./configure", *args
	 inreplace "gdk-pixbuf-loader/Makefile",
	 "$(GDK_PIXBUF_QUERYLOADERS) > $(DESTDIR)$(gdk_pixbuf_cache_file) ;",
	 ""
	 system "make", "install",
	 "gdk_pixbuf_binarydir=#{lib}/gdk-pixbuf-2.0/2.10.0/loaders",
	 "gdk_pixbuf_moduledir=#{lib}/gdk-pixbuf-2.0/2.10.0/loaders"
	 ENV["GDK_PIXBUF_MODULEDIR"] = "#{HOMEBREW_PREFIX}/lib/gdk-pixbuf-2.0/2.10.0/loaders"
	 system "#{Formula["gdk-pixbuf"].opt_bin}/gdk-pixbuf-query-loaders", "--update-cache"
