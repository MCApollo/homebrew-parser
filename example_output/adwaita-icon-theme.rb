name :
	 AdwaitaIconTheme
homepage :
	 https://developer.gnome.org
url :
	 https://download.gnome.org/sources/adwaita-icon-theme/3.30/adwaita-icon-theme-3.30.1.tar.xz
description :
	 Icons for the GNOME project
build_deps :
	 gettext
	 gtk+3
	 intltool
	 pkg-config
link_deps :
	 librsvg
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "GTK_UPDATE_ICON_CACHE=#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache"
	 system "make", "install"
