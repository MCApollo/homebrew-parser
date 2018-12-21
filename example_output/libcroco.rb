name :
	 Libcroco
homepage :
	 http://www.linuxfromscratch.org/blfs/view/svn/general/libcroco.html
url :
	 https://download.gnome.org/sources/libcroco/0.6/libcroco-0.6.12.tar.xz
description :
	 CSS parsing and manipulation toolkit for GNOME
build_deps :
	 intltool
	 pkg-config
link_deps :
	 glib
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-Bsymbolic"
	 system "make", "install"
