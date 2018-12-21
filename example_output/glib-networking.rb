name :
	 GlibNetworking
homepage :
	 https://launchpad.net/glib-networking
url :
	 https://download.gnome.org/sources/glib-networking/2.58/glib-networking-2.58.0.tar.xz
description :
	 Network related modules for glib
build_deps :
	 meson
	 ninja
	 pkg-config
	 python
link_deps :
	 glib
	 gnutls
	 gsettings-desktop-schemas
conflicts :
patches :
EOF_patch :
install :
	 ENV["DESTDIR"] = "/"
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}",
	 "-Dlibproxy_support=false",
	 ".."
	 system "ninja", "-v"
	 system "ninja", "install", "-v"
	 system Formula["glib"].opt_bin/"gio-querymodules", HOMEBREW_PREFIX/"lib/gio/modules"
