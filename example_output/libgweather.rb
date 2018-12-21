name :
	 Libgweather
homepage :
	 https://wiki.gnome.org/Projects/LibGWeather
url :
	 https://download.gnome.org/sources/libgweather/3.28/libgweather-3.28.2.tar.xz
description :
	 GNOME library for weather, locations and timezones
build_deps :
	 gobject-introspection
	 meson-internal
	 ninja
	 pkg-config
	 python
link_deps :
	 geocode-glib
	 gtk+3
	 libsoup
	 vala
conflicts :
patches :
EOF_patch :
install :
	 ENV.refurbish_args
	 ENV["DESTDIR"] = ""
	 inreplace "meson/meson_post_install.py", "if not os.environ.get('DESTDIR'):", "if 'DESTDIR' not in os.environ:"
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", ".."
	 system "ninja"
	 system "ninja", "install"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
