name :
	 GnomeCommon
homepage :
	 https://gitlab.gnome.org/GNOME/gnome-common
url :
	 https://download.gnome.org/sources/gnome-common/3.18/gnome-common-3.18.0.tar.xz
description :
	 Core files for GNOME
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
