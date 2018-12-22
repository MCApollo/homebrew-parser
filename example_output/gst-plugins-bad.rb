name :
	 GstPluginsBad
homepage :
	 https://gstreamer.freedesktop.org/
url :
	 https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.14.4.tar.xz
description :
	 GStreamer plugins less supported, not fully tested
build_deps :
	 gobject-introspection
	 libtool
	 pkg-config
link_deps :
	 faac
	 faad2
	 gettext
	 gst-plugins-base
	 jpeg
	 libmms
	 openssl
	 opus
	 orc
	 dirac
	 fdk-aac
	 gnutls
	 libdvdread
	 libexif
	 libnice
	 libvo-aacenc
	 opencv@2
	 rtmpdump
	 schroedinger
	 sound-touch
	 srt
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-yadif
	 --disable-examples
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
