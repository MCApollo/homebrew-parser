name :
	 Libnice
homepage :
	 https://wiki.freedesktop.org/nice/
url :
	 https://nice.freedesktop.org/releases/libnice-0.1.14.tar.gz
description :
	 GLib ICE implementation
build_deps :
	 pkg-config
link_deps :
	 glib
	 gnutls
	 gstreamer
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
