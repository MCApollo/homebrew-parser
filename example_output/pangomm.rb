name :
	 Pangomm
homepage :
	 https://www.pango.org/
url :
	 https://download.gnome.org/sources/pangomm/2.42/pangomm-2.42.0.tar.xz
description :
	 C++ interface to Pango
build_deps :
	 pkg-config
link_deps :
	 cairomm
	 glibmm
	 pango
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
