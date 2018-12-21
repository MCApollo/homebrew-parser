name :
	 Gssdp
homepage :
	 https://wiki.gnome.org/GUPnP/
url :
	 https://download.gnome.org/sources/gssdp/1.0/gssdp-1.0.2.tar.xz
description :
	 GUPnP library for resource discovery and announcement over SSDP
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 glib
	 libsoup
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
