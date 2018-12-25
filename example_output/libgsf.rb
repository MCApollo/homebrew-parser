name :
	 Libgsf
homepage :
	 https://developer.gnome.org/gsf/
url :
	 https://download.gnome.org/sources/libgsf/1.14/libgsf-1.14.44.tar.xz
description :
	 I/O abstraction library for dealing with structured file formats
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 glib
optional_deps :
conflicts :
resource :
	 []
	 []
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
