name :
	 Libgee
homepage :
	 https://wiki.gnome.org/Projects/Libgee
url :
	 https://download.gnome.org/sources/libgee/0.20/libgee-0.20.1.tar.xz
description :
	 Collection library providing GObject-based interfaces
build_deps :
	 gobject-introspection
	 pkg-config
	 vala
link_deps :
	 glib
conflicts :
patches :
EOF_patch :
install :
	 inreplace "gee/Makefile.in" do |s|
	 s.gsub! "@HAVE_INTROSPECTION_TRUE@girdir = @INTROSPECTION_GIRDIR@",
	 "@HAVE_INTROSPECTION_TRUE@girdir = $(datadir)/gir-1.0"
	 s.gsub! "@HAVE_INTROSPECTION_TRUE@typelibdir = @INTROSPECTION_TYPELIBDIR@",
	 "@HAVE_INTROSPECTION_TRUE@typelibdir = $(libdir)/girepository-1.0"
