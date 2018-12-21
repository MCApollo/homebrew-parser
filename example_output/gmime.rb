name :
	 Gmime
homepage :
	 https://spruce.sourceforge.io/gmime/
url :
	 https://download.gnome.org/sources/gmime/3.2/gmime-3.2.3.tar.xz
description :
	 MIME mail utilities
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 glib
	 gpgme
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --enable-largefile
	 --disable-vala
	 --disable-glibtest
	 --enable-crypto
	 --enable-introspection
	 ]
	 system "./configure", *args
	 system "make", "install"
