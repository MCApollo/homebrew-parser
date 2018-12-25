name :
	 Gxml
homepage :
	 https://wiki.gnome.org/GXml
url :
	 https://download.gnome.org/sources/gxml/0.16/gxml-0.16.3.tar.xz
description :
	 GObject-based XML DOM API
build_deps :
	 gobject-introspection
	 gtk-doc
	 intltool
	 pkg-config
	 vala
link_deps :
	 glib
	 libgee
	 libxml2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "gxml/Makefile.in" do |s|
	 s.gsub! "@HAVE_INTROSPECTION_TRUE@girdir = $(INTROSPECTION_GIRDIR)",
	 "@HAVE_INTROSPECTION_TRUE@girdir = $(datadir)/gir-1.0"
	 s.gsub! "@HAVE_INTROSPECTION_TRUE@typelibdir = $(INTROSPECTION_TYPELIBDIR)",
	 "@HAVE_INTROSPECTION_TRUE@typelibdir = $(libdir)/girepository-1.0"
	 end
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-schemas-compile"
	 system "make", "install"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
