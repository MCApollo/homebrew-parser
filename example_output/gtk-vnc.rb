name :
	 GtkVnc
homepage :
	 https://wiki.gnome.org/Projects/gtk-vnc
url :
	 https://download.gnome.org/sources/gtk-vnc/0.9/gtk-vnc-0.9.0.tar.xz
description :
	 VNC viewer widget for GTK
build_deps :
	 gettext
	 gobject-introspection
	 intltool
	 pkg-config
	 python
link_deps :
	 gnutls
	 gtk+3
	 libgcrypt
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --with-gtk=3.0
	 --with-examples
	 --disable-vala
	 --enable-introspection
	 ]
	 ENV.append "CPPFLAGS", "-D_XOPEN_SOURCE=600"
	 ENV.append "CPPFLAGS", "-D_DARWIN_C_SOURCE"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
