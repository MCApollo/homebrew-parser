name :
	 GstRtspServer
homepage :
	 https://gstreamer.freedesktop.org/modules/gst-rtsp-server.html
url :
	 https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.14.4.tar.xz
description :
	 RTSP server library based on GStreamer
build_deps :
	 gobject-introspection
	 libtool
	 pkg-config
link_deps :
	 gettext
	 gst-plugins-base
	 gstreamer
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--disable-examples",
	 "--disable-tests",
	 "--enable-introspection=yes"
	 system "make", "install"
