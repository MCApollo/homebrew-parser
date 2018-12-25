name :
	 Vte3
homepage :
	 https://developer.gnome.org/vte/
url :
	 https://download.gnome.org/sources/vte/0.54/vte-0.54.3.tar.xz
description :
	 Terminal emulator widget used by GNOME terminal
build_deps :
	 gobject-introspection
	 intltool
	 pkg-config
link_deps :
	 gettext
	 gnutls
	 gtk+3
	 pcre2
	 vala
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = [
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-Bsymbolic",
	 "--enable-introspection=yes",
	 "--enable-gnome-pty-helper",
	 ]
	 system "./configure", *args
	 system "make", "install"
