name :
	 Goffice
homepage :
	 https://developer.gnome.org/goffice/
url :
	 https://download.gnome.org/sources/goffice/0.10/goffice-0.10.44.tar.xz
description :
	 Gnumeric spreadsheet program
build_deps :
	 intltool
	 pkg-config
link_deps :
	 atk
	 cairo
	 gdk-pixbuf
	 gettext
	 gtk+3
	 libgsf
	 librsvg
	 pango
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 args = %W[--disable-dependency-tracking --prefix=#{prefix}]
	 if build.head?
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make", "install"
