name :
	 Zenity
homepage :
	 https://wiki.gnome.org/Projects/Zenity
url :
	 https://download.gnome.org/sources/zenity/3.30/zenity-3.30.0.tar.xz
description :
	 GTK+ dialog boxes for the command-line
build_deps :
	 itstool
	 pkg-config
link_deps :
	 gtk+3
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
