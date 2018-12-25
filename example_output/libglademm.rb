name :
	 Libglademm
homepage :
	 https://gnome.org
url :
	 https://download.gnome.org/sources/libglademm/2.6/libglademm-2.6.7.tar.bz2
description :
	 C++ wrapper around libglade
build_deps :
	 pkg-config
link_deps :
	 gtkmm
	 libglade
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
