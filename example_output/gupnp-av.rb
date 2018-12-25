name :
	 GupnpAv
homepage :
	 https://wiki.gnome.org/GUPnP/
url :
	 https://download.gnome.org/sources/gupnp-av/0.12/gupnp-av-0.12.11.tar.xz
description :
	 Library to help implement UPnP A/V profiles
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 gupnp
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["ax_cv_check_cflags__Wl___no_as_needed"] = "no"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
