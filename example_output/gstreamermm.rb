name :
	 Gstreamermm
homepage :
	 https://gstreamer.freedesktop.org/bindings/cplusplus.html
url :
	 https://download.gnome.org/sources/gstreamermm/1.10/gstreamermm-1.10.0.tar.xz
description :
	 GStreamer C++ bindings
build_deps :
	 pkg-config
link_deps :
	 glibmm
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
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
