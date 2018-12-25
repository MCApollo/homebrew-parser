name :
	 Anjuta
homepage :
	 http://anjuta.org
url :
	 https://download.gnome.org/sources/anjuta/3.28/anjuta-3.28.0.tar.xz
description :
	 GNOME Integrated Development Environment
build_deps :
	 intltool
	 itstool
	 pkg-config
link_deps :
	 adwaita-icon-theme
	 autogen
	 gdl
	 gnome-themes-standard
	 gnutls
	 gtksourceview3
	 hicolor-icon-theme
	 libgda
	 libxml2
	 python@2
	 shared-mime-info
	 vala
	 vte3
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-schemas-compile"
	 ENV.append_path "PYTHONPATH", "#{Formula["libxml2"].opt_lib}/python2.7/site-packages"
	 system "make", "install"
	 hshare = HOMEBREW_PREFIX/"share"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", hshare/"glib-2.0/schemas"
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", hshare/"icons/hicolor"
	 if File.file?("#{hshare}/icons/HighContrast/.icon-theme.cache")
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", hshare/"icons/HighContrast"
	 end
	 system "#{Formula["shared-mime-info"].opt_bin}/update-mime-database", hshare/"mime"
