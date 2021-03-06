name :
	 Libxmlxx
homepage :
	 https://libxmlplusplus.sourceforge.io/
url :
	 https://download.gnome.org/sources/libxml++/2.40/libxml++-2.40.1.tar.xz
description :
	 C++ wrapper for libxml
build_deps :
	 pkg-config
link_deps :
	 glibmm
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
