name :
	 GstValidate
homepage :
	 https://gstreamer.freedesktop.org/data/doc/gstreamer/head/gst-validate/html/
url :
	 https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.14.4.tar.xz
description :
	 Tools to validate GstElements from GStreamer
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 gettext
	 gst-plugins-base
	 gstreamer
	 json-glib
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 ]
	 if build.head?
	 ENV["NOCONFIGURE"] = "yes"
	 cd "validate" do
	 system "./autogen.sh"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 end
	 else
	 system "./configure", *args
	 system "make"
	 system "make", "install"
