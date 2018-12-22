name :
	 GnomeRecipes
homepage :
	 https://wiki.gnome.org/Apps/Recipes
url :
	 https://download.gnome.org/sources/gnome-recipes/2.0/gnome-recipes-2.0.2.tar.xz
description :
	 Formula for GNOME recipes
build_deps :
	 itstool
	 meson
	 ninja
	 pkg-config
	 python
link_deps :
	 adwaita-icon-theme
	 gnome-autoar
	 gnu-tar
	 gspell
	 gtk+3
	 json-glib
	 libcanberra
	 librest
	 libsoup
	 libxml2
conflicts :
patches :
EOF_patch :
install :
	 resource("goa").stage do
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{libexec}",
	 "--disable-backend"
	 system "make", "install"
	 end
	 ENV.prepend_path "PKG_CONFIG_PATH", libexec/"lib/pkgconfig"
	 inreplace "src/gr-recipe-store.c", "argv[0] = \"tar\";", "argv[0] = \"gtar\";"
	 ENV["DESTDIR"] = ""
	 ENV.delete "PYTHONPATH"
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/hicolor"
