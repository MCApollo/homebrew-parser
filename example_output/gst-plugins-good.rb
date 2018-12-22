name :
	 GstPluginsGood
homepage :
	 https://gstreamer.freedesktop.org/
url :
	 https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.14.4.tar.xz
description :
	 GStreamer plugins (well-supported, under the LGPL)
build_deps :
	 pkg-config
link_deps :
	 check
	 cairo
	 flac
	 gettext
	 gst-plugins-base
	 jpeg
	 libpng
	 libshout
	 libsoup
	 libvpx
	 orc
	 speex
	 taglib
	 aalib
	 gdk-pixbuf
	 gtk+3
	 jack
	 libcaca
	 libdv
	 pulseaudio
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-gtk-doc
	 --disable-goom
	 --with-default-videosink=ximagesink
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 ]
	 args << "--enable-gtk3" if build.with? "gtk+3"
	 if build.with? "x11"
	 args << "--with-x"
	 else
	 args << "--disable-x"
	 end
	 args << "--disable-osx_video" if MacOS.version == :snow_leopard
	 if build.head?
	 ENV["NOCONFIGURE"] = "yes"
	 system "./autogen.sh"
	 end
	 system "./configure", *args
	 system "make"
	 system "make", "install"
