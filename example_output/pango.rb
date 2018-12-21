name :
	 Pango
homepage :
	 https://www.pango.org/
url :
	 https://download.gnome.org/sources/pango/1.42/pango-1.42.4.tar.xz
description :
	 Framework for layout and rendering of i18n text
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 cairo
	 fontconfig
	 fribidi
	 glib
	 harfbuzz
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e0aa10/pango/pango_font_size.patch
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-html-dir=#{share}/doc",
	 "--enable-introspection=yes",
	 "--enable-static",
	 "--without-xft"
	 system "make"
	 system "make", "install"
