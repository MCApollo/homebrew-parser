name :
	 Gtkextra
homepage :
	 https://gtkextra.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/gtkextra/3.3/gtkextra-3.3.4.tar.gz
description :
	 Widgets for creating GUIs for GTK+
build_deps :
	 pkg-config
link_deps :
	 gtk+
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--enable-tests",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
