name :
	 Vala
homepage :
	 https://wiki.gnome.org/Projects/Vala
url :
	 https://download.gnome.org/sources/vala/0.42/vala-0.42.3.tar.xz
description :
	 Compiler for the GObject type system
build_deps :
link_deps :
	 gettext
	 glib
	 graphviz
	 pkg-config
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
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
