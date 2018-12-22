name :
	 Libhttpseverywhere
homepage :
	 https://github.com/gnome/libhttpseverywhere
url :
	 https://download.gnome.org/sources/libhttpseverywhere/0.8/libhttpseverywhere-0.8.3.tar.xz
description :
	 Bring HTTPSEverywhere to desktop apps
build_deps :
	 gobject-introspection
	 meson-internal
	 ninja
	 pkg-config
	 vala
link_deps :
	 glib
	 json-glib
	 libarchive
	 libgee
	 libsoup
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
