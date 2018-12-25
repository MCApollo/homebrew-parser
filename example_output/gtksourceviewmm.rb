name :
	 Gtksourceviewmm
homepage :
	 https://developer.gnome.org/gtksourceviewmm/
url :
	 https://download.gnome.org/sources/gtksourceviewmm/2.10/gtksourceviewmm-2.10.3.tar.xz
description :
	 C++ bindings for gtksourceview
build_deps :
	 pkg-config
link_deps :
	 gtkmm
	 gtksourceview
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
