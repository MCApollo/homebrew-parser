name :
	 Msitools
homepage :
	 https://wiki.gnome.org/msitools
url :
	 https://download.gnome.org/sources/msitools/0.98/msitools-0.98.tar.xz
description :
	 Windows installer (.MSI) tool
build_deps :
	 intltool
	 pkg-config
link_deps :
	 e2fsprogs
	 gcab
	 gettext
	 glib
	 libgsf
	 vala
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
