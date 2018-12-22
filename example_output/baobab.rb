name :
	 Baobab
homepage :
	 https://wiki.gnome.org/Apps/Baobab
url :
	 https://download.gnome.org/sources/baobab/3.30/baobab-3.30.0.tar.xz
description :
	 Gnome disk usage analyzer
build_deps :
	 itstool
	 meson
	 ninja
	 pkg-config
	 python@2
	 vala
link_deps :
	 adwaita-icon-theme
	 gtk+3
	 hicolor-icon-theme
conflicts :
patches :
EOF_patch :
install :
	 ENV["DESTDIR"] = "/"
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/hicolor"
