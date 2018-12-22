name :
	 Gexiv2
homepage :
	 https://wiki.gnome.org/Projects/gexiv2
url :
	 https://download.gnome.org/sources/gexiv2/0.10/gexiv2-0.10.9.tar.xz
description :
	 GObject wrapper around the Exiv2 photo metadata library
build_deps :
	 gobject-introspection
	 meson-internal
	 ninja
	 pkg-config
	 python
	 vala
link_deps :
	 exiv2
	 glib
conflicts :
patches :
EOF_patch :
install :
	 pyver = Language::Python.major_minor_version "python3"
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", "-Dpython3-girdir=#{lib}/python#{pyver}/site-packages/gi/overrides", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
