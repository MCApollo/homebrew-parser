name :
	 Gpredict
homepage :
	 http://gpredict.oz9aec.net/
url :
	 https://github.com/csete/gpredict/releases/download/v2.2.1/gpredict-2.2.1.tar.bz2
description :
	 Real-time satellite tracking/prediction application
build_deps :
	 intltool
	 pkg-config
link_deps :
	 adwaita-icon-theme
	 gettext
	 glib
	 goocanvas
	 gtk+3
	 hamlib
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
