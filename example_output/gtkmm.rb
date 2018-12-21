name :
	 Gtkmm
homepage :
	 https://www.gtkmm.org/
url :
	 https://download.gnome.org/sources/gtkmm/2.24/gtkmm-2.24.5.tar.xz
description :
	 C++ interfaces for GTK+ and GNOME
build_deps :
	 pkg-config
link_deps :
	 atkmm
	 cairomm
	 glibmm
	 gtk+
	 libsigc++
	 pangomm
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
