name :
	 Atkmm
homepage :
	 https://www.gtkmm.org/
url :
	 https://download.gnome.org/sources/atkmm/2.24/atkmm-2.24.2.tar.xz
description :
	 Official C++ interface for the ATK accessibility toolkit library
build_deps :
	 pkg-config
link_deps :
	 atk
	 glibmm
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
