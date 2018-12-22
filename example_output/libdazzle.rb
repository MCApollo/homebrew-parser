name :
	 Libdazzle
homepage :
	 https://gitlab.gnome.org/GNOME/libdazzle
url :
	 https://download.gnome.org/sources/libdazzle/3.30/libdazzle-3.30.2.tar.xz
description :
	 GNOME companion library to GObject and Gtk+
build_deps :
	 gobject-introspection
	 meson-internal
	 ninja
	 pkg-config
	 python
link_deps :
	 glib
	 gtk+3
conflicts :
patches :
EOF_patch :
install :
	 ENV.refurbish_args
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", "-Dwith_vapi=false", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
