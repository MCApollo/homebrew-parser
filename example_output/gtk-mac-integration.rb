name :
	 GtkMacIntegration
homepage :
	 https://wiki.gnome.org/Projects/GTK+/OSX/Integration
url :
	 https://download.gnome.org/sources/gtk-mac-integration/2.1/gtk-mac-integration-2.1.3.tar.xz
description :
	 Integrates GTK macOS applications with the Mac desktop
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 gettext
	 gtk+
	 gtk+3
	 pygtk
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --with-gtk2
	 --with-gtk3
	 --enable-python=yes
	 --enable-introspection=yes
	 ]
	 if build.head?
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
