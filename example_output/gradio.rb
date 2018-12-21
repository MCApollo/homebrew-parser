name :
	 Gradio
homepage :
	 https://github.com/haecker-felix/Gradio
url :
	 https://github.com/haecker-felix/Gradio/archive/v7.2.tar.gz
description :
	 GTK3 app for finding and listening to internet radio stations
build_deps :
	 meson
	 ninja
link_deps :
	 adwaita-icon-theme
	 cairo
	 gettext
	 glib
	 gst-libav
	 gst-plugins-base
	 gstreamer
	 gtk+3
	 hicolor-icon-theme
	 json-glib
	 libsoup
	 python
conflicts :
patches :
EOF_patch :
install :
	 ENV["DESTDIR"] = "/"
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", ".."
	 system "ninja"
	 system "ninja", "install"
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/hicolor"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
