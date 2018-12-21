name :
	 Gtksourceviewmm3
homepage :
	 https://developer.gnome.org/gtksourceviewmm/
url :
	 https://download.gnome.org/sources/gtksourceviewmm/3.18/gtksourceviewmm-3.18.0.tar.xz
description :
	 C++ bindings for gtksourceview3
build_deps :
	 pkg-config
link_deps :
	 gtkmm3
	 gtksourceview3
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
