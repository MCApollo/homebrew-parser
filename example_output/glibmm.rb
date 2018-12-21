name :
	 Glibmm
homepage :
	 https://www.gtkmm.org/
url :
	 https://download.gnome.org/sources/glibmm/2.58/glibmm-2.58.0.tar.xz
description :
	 C++ interface to glib
build_deps :
	 pkg-config
link_deps :
	 glib
	 libsigc++
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
