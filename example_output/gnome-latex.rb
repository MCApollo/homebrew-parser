name :
	 GnomeLatex
homepage :
	 https://wiki.gnome.org/Apps/LaTeXila
url :
	 https://download.gnome.org/sources/gnome-latex/3.30/gnome-latex-3.30.2.tar.xz
description :
	 LaTeX editor for the GNOME desktop
build_deps :
	 gobject-introspection
	 intltool
	 itstool
	 pkg-config
	 vala
link_deps :
	 adwaita-icon-theme
	 gspell
	 libgee
	 tepl
	 gnome-themes-standard
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-schemas-compile",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--disable-dconf-migration",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/hicolor"
	 if File.file?("#{HOMEBREW_PREFIX}/share/icons/HighContrast/.icon-theme.cache")
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/HighContrast"
