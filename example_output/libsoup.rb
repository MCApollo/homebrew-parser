name :
	 Libsoup
homepage :
	 https://wiki.gnome.org/Projects/libsoup
url :
	 https://download.gnome.org/sources/libsoup/2.64/libsoup-2.64.2.tar.xz
description :
	 HTTP client/server library for GNOME
build_deps :
	 gobject-introspection
	 intltool
	 pkg-config
	 python
link_deps :
	 glib-networking
	 gnutls
	 libpsl
	 vala
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --disable-tls-check
	 --enable-introspection=yes
	 ]
	 inreplace "libsoup/Makefile.in",
	 "VAPIDIR = @VAPIDIR@",
	 "VAPIDIR = @datadir@/vala/vapi"
	 system "./configure", *args
	 system "make", "install"
