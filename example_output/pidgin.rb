name :
	 Pidgin
homepage :
	 https://pidgin.im/
url :
	 https://downloads.sourceforge.net/project/pidgin/Pidgin/2.13.0/pidgin-2.13.0.tar.bz2
description :
	 Multi-protocol chat client
build_deps :
	 intltool
	 pkg-config
link_deps :
	 cairo
	 gettext
	 glib
	 gnutls
	 gtk+
	 libgcrypt
	 libidn
	 libotr
	 pango
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --disable-avahi
	 --disable-dbus
	 --disable-doxygen
	 --disable-gevolution
	 --disable-gstreamer
	 --disable-gstreamer-interfaces
	 --disable-gtkspell
	 --disable-meanwhile
	 --disable-vv
	 --enable-gnutls=yes
	 --with-tclconfig=#{MacOS.sdk_path}/System/Library/Frameworks/Tcl.framework
	 --with-tkconfig=#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework
	 --without-x
	 ]
	 system "./configure", *args
	 system "make", "install"
	 resource("pidgin-otr").stage do
	 ENV.prepend "CFLAGS", "-I#{Formula["libotr"].opt_include}"
	 ENV.append_path "PKG_CONFIG_PATH", "#{lib}/pkgconfig"
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
