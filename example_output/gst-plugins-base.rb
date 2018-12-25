name :
	 GstPluginsBase
homepage :
	 https://gstreamer.freedesktop.org/
url :
	 https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.14.4.tar.xz
description :
	 GStreamer plugins (well-supported, basic set)
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 gettext
	 gstreamer
	 libogg
	 libvorbis
	 opus
	 orc
	 pango
	 theora
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --enable-experimental
	 --disable-libvisual
	 --disable-alsa
	 --disable-cdparanoia
	 --without-x
	 --disable-x
	 --disable-xvideo
	 --disable-xshm
	 --disable-debug
	 --disable-dependency-tracking
	 --enable-introspection=yes
	 ]
	 if build.head?
	 ENV["NOCONFIGURE"] = "yes"
	 system "./autogen.sh"
	 end
	 system "./configure", *args
	 system "make"
	 system "make", "install"
