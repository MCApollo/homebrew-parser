name :
	 Tepl
homepage :
	 https://wiki.gnome.org/Projects/Tepl
url :
	 https://download.gnome.org/sources/tepl/4.2/tepl-4.2.0.tar.xz
description :
	 GNOME Text Editor Product Line
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 amtk
	 gtksourceview4
	 uchardet
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
