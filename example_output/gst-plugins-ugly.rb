name :
	 GstPluginsUgly
homepage :
	 https://gstreamer.freedesktop.org/
url :
	 https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.14.4.tar.xz
description :
	 Library for constructing graphs of media-handling components
build_deps :
	 pkg-config
link_deps :
	 flac
	 gettext
	 gst-plugins-base
	 jpeg
	 lame
	 libmms
	 libshout
	 libvorbis
	 pango
	 theora
	 x264
	 a52dec
	 aalib
	 cdparanoia
	 dirac
	 gtk+
	 libcaca
	 libdvdread
	 libmpeg2
	 liboil
	 mad
	 opencore-amr
	 two-lame
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --mandir=#{man}
	 --disable-debug
	 --disable-dependency-tracking
	 ]
	 if build.head?
	 ENV["NOCONFIGURE"] = "yes"
	 system "./autogen.sh"
