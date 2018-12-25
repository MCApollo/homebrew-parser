name :
	 FileRoller
homepage :
	 https://wiki.gnome.org/Apps/FileRoller
url :
	 https://download.gnome.org/sources/file-roller/3.30/file-roller-3.30.1.tar.xz
description :
	 GNOME archive manager
build_deps :
	 itstool
	 meson
	 ninja
	 pkg-config
	 python
link_deps :
	 adwaita-icon-theme
	 gtk+3
	 hicolor-icon-theme
	 json-glib
	 libarchive
	 libmagic
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "CFLAGS", "-I#{Formula["libmagic"].opt_include}"
	 ENV.append "LIBS", "-L#{Formula["libmagic"].opt_lib}"
	 ENV["DESTDIR"] = ""
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", "-Dpackagekit=false", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/hicolor"
