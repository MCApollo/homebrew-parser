name :
	 TemplateGlib
homepage :
	 https://gitlab.gnome.org/GNOME/template-glib
url :
	 https://download.gnome.org/sources/template-glib/3.30/template-glib-3.30.0.tar.xz
description :
	 GNOME templating library for GLib
build_deps :
	 bison
	 meson-internal
	 ninja
	 pkg-config
	 python
link_deps :
	 glib
	 gobject-introspection
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", "-Dwith_vapi=false", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
