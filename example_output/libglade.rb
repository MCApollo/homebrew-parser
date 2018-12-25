name :
	 Libglade
homepage :
	 https://glade.gnome.org
url :
	 https://download.gnome.org/sources/libglade/2.6/libglade-2.6.4.tar.gz
description :
	 RAD tool to help build GTK+ interfaces
build_deps :
	 pkg-config
link_deps :
	 gtk+
	 libxml2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-lgmodule-2.0"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
