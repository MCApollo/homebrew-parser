name :
	 Glade
homepage :
	 https://glade.gnome.org/
url :
	 https://download.gnome.org/sources/glade/3.22/glade-3.22.1.tar.xz
description :
	 RAD tool for the GTK+ and GNOME environment
build_deps :
	 docbook-xsl
	 gobject-introspection
	 intltool
	 itstool
	 pkg-config
link_deps :
	 adwaita-icon-theme
	 gettext
	 gtk+3
	 gtk-mac-integration
	 hicolor-icon-theme
	 libxml2
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-gladeui",
	 "--enable-introspection"
	 inreplace "src/Makefile", "-c -o glade-glade-registration.o", "-x objective-c -c -o glade-glade-registration.o"
	 system "make"
	 system "make", "install"
