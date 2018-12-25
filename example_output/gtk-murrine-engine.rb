name :
	 GtkMurrineEngine
homepage :
	 https://github.com/GNOME/murrine
url :
	 https://download.gnome.org/sources/murrine/0.98/murrine-0.98.2.tar.xz
description :
	 Murrine GTK+ engine
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
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
	 "--prefix=#{prefix}",
	 "--enable-animation"
	 system "make", "install"
