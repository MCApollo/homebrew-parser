name :
	 Libsecret
homepage :
	 https://wiki.gnome.org/Projects/Libsecret
url :
	 https://download.gnome.org/sources/libsecret/0.18/libsecret-0.18.6.tar.xz
description :
	 Library for storing/retrieving passwords and other secrets
build_deps :
	 docbook-xsl
	 gettext
	 gnu-sed
	 gobject-introspection
	 intltool
	 pkg-config
	 vala
link_deps :
	 glib
	 libgcrypt
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --enable-introspection
	 --enable-vala
	 ]
	 system "./configure", *args
	 inreplace "Makefile", "sed", "gsed"
	 system "make", "install"
