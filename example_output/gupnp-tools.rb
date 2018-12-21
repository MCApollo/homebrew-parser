name :
	 GupnpTools
homepage :
	 https://wiki.gnome.org/GUPnP/
url :
	 https://download.gnome.org/sources/gupnp-tools/0.8/gupnp-tools-0.8.15.tar.xz
description :
	 Free replacements of Intel's UPnP tools
build_deps :
	 meson
	 ninja
	 pkg-config
link_deps :
	 gettext
	 gtk+3
	 gtksourceview4
	 gupnp
	 gupnp-av
	 libsoup
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", ".."
	 system "ninja"
	 system "ninja", "install"
