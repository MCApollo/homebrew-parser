name :
	 Gstreamer
homepage :
	 https://gstreamer.freedesktop.org/
url :
	 https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.14.4.tar.xz
description :
	 Development framework for multimedia applications
build_deps :
	 bison
	 gobject-introspection
	 pkg-config
link_deps :
	 gettext
	 glib
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-gtk-doc
	 --enable-introspection=yes
	 ]
	 if build.head?
	 ENV["NOCONFIGURE"] = "yes"
	 system "./autogen.sh"
	 args << "--with-ptp-helper-permissions=none"
	 end
	 inreplace "configure", 'PLUGINDIR="$full_var"',
	 "PLUGINDIR=\"#{HOMEBREW_PREFIX}/lib/gstreamer-1.0\""
	 system "./configure", *args
	 system "make"
	 system "make", "install"
