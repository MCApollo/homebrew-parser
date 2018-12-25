name :
	 Aravis
homepage :
	 https://wiki.gnome.org/Projects/Aravis
url :
	 https://github.com/AravisProject/aravis/archive/ARAVIS_0_6_0.tar.gz
description :
	 Vision library for genicam based cameras
build_deps :
	 autoconf
	 automake
	 gtk-doc
	 libtool
	 pkg-config
link_deps :
	 adwaita-icon-theme
	 glib
	 gst-plugins-base
	 gstreamer
	 gtk+3
	 intltool
	 libnotify
	 libusb
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "viewer/Makefile.am", "gtk-update-icon-cache", "gtk3-update-icon-cache"
	 system "./autogen.sh", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
