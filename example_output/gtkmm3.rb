name :
	 Gtkmm3
homepage :
	 https://www.gtkmm.org/
url :
	 https://download.gnome.org/sources/gtkmm/3.24/gtkmm-3.24.0.tar.xz
description :
	 C++ interfaces for GTK+ and GNOME
build_deps :
	 pkg-config
link_deps :
	 atkmm
	 gtk+3
	 pangomm
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-silent-rules", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
