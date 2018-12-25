name :
	 GstLibav
homepage :
	 https://gstreamer.freedesktop.org/
url :
	 https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.14.4.tar.xz
description :
	 GStreamer plugins for Libav (a fork of FFmpeg)
build_deps :
	 pkg-config
	 yasm
link_deps :
	 gst-plugins-base
	 xz
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 ENV["NOCONFIGURE"] = "yes"
	 system "./autogen.sh"
	 end
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make"
	 system "make", "install"
