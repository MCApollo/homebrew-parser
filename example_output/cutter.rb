name :
	 Cutter
homepage :
	 https://cutter.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/cutter/cutter/1.2.6/cutter-1.2.6.tar.gz
description :
	 Unit Testing Framework for C and C++
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 glib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-glibtest",
	 "--disable-goffice",
	 "--disable-gstreamer",
	 "--disable-libsoup"
	 system "make"
	 system "make", "install"
