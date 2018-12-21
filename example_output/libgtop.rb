name :
	 Libgtop
homepage :
	 https://library.gnome.org/devel/libgtop/stable/
url :
	 https://download.gnome.org/sources/libgtop/2.38/libgtop-2.38.0.tar.xz
description :
	 Library for portably obtaining information about processes
build_deps :
	 autoconf
	 automake
	 gnome-common
	 gobject-introspection
	 gtk-doc
	 intltool
	 libtool
	 pkg-config
link_deps :
	 gettext
	 glib
conflicts :
patches :
	 https://github.com/GNOME/libgtop/commit/42b049f338363f92c1e93b4549fc944098eae674.diff?full_index=1
EOF_patch :
install :
	 system "./autogen.sh", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--without-x"
	 system "make", "install"
