name :
	 GnomeThemesStandard
homepage :
	 https://gitlab.gnome.org/GNOME/gnome-themes-extra
url :
	 https://download.gnome.org/sources/gnome-themes-standard/3.22/gnome-themes-standard-3.22.3.tar.xz
description :
	 Default themes for the GNOME desktop environment
build_deps :
	 gettext
	 intltool
	 pkg-config
link_deps :
	 gtk+
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-gtk3-engine"
	 system "make", "install"
