name :
	 GstEditingServices
homepage :
	 https://gstreamer.freedesktop.org/modules/gst-editing-services.html
url :
	 https://gstreamer.freedesktop.org/src/gst-editing-services/gstreamer-editing-services-1.14.4.tar.xz
description :
	 GStreamer Editing Services
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 gst-plugins-base
	 gstreamer
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-gtk-doc",
	 "--disable-docbook"
	 system "make"
	 system "make", "install"
