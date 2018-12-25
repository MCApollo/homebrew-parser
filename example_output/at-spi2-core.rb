name :
	 AtSpi2Core
homepage :
	 https://wiki.linuxfoundation.org/accessibility/
url :
	 https://download.gnome.org/sources/at-spi2-core/2.30/at-spi2-core-2.30.0.tar.xz
description :
	 Protocol definitions and daemon for D-Bus at-spi
build_deps :
	 gobject-introspection
	 intltool
	 meson-internal
	 ninja
	 pkg-config
	 python
link_deps :
	 dbus
	 gettext
	 glib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.refurbish_args
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
