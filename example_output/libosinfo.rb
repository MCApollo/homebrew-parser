name :
	 Libosinfo
homepage :
	 https://libosinfo.org/
url :
	 https://releases.pagure.org/libosinfo/libosinfo-1.2.0.tar.gz
description :
	 The Operating System information database
build_deps :
	 gobject-introspection
	 intltool
	 pkg-config
link_deps :
	 check
	 gettext
	 glib
	 libsoup
	 libxml2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "Makefile.in", "wget -q -O", "curl -o"
	 args = %W[
	 --prefix=#{prefix}
	 --localstatedir=#{var}
	 --mandir=#{man}
	 --sysconfdir=#{etc}
	 --disable-silent-rules
	 --disable-udev
	 --disable-vala
	 --enable-introspection
	 --enable-tests
	 ]
	 system "./configure", *args
	 system "make"
	 system "make", "install"
