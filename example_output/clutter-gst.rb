name :
	 ClutterGst
homepage :
	 https://developer.gnome.org/clutter-gst/
url :
	 https://download.gnome.org/sources/clutter-gst/3.0/clutter-gst-3.0.26.tar.xz
description :
	 ClutterMedia interface using GStreamer for video and audio
build_deps :
	 pkg-config
link_deps :
	 clutter
	 gdk-pixbuf
	 gst-plugins-base
	 gstreamer
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-debug
	 --prefix=#{prefix}
	 --enable-introspection=yes
	 --disable-silent-rules
	 --disable-gtk-doc-html
	 ]
	 ENV.append "CFLAGS", `pkg-config --cflags gdk-pixbuf-2.0`.chomp
	 ENV.append "LIBS", `pkg-config --libs gdk-pixbuf-2.0`.chomp
	 system "./configure", *args
	 system "make", "install"
