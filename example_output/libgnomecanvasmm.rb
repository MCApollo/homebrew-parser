name :
	 Libgnomecanvasmm
homepage :
	 https://launchpad.net/libgnomecanvasmm
url :
	 https://download.gnome.org/sources/libgnomecanvasmm/2.26/libgnomecanvasmm-2.26.0.tar.bz2
description :
	 C++ wrapper for libgnomecanvas
build_deps :
	 pkg-config
link_deps :
	 gtkmm
	 libgnomecanvas
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
