name :
	 Gupnp
homepage :
	 https://wiki.gnome.org/Projects/GUPnP
url :
	 https://download.gnome.org/sources/gupnp/1.0/gupnp-1.0.3.tar.xz
description :
	 Framework for creating UPnP devices and control points
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 glib
	 gssdp
	 libsoup
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
