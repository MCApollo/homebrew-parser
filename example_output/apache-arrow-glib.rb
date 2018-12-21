name :
	 ApacheArrowGlib
homepage :
	 https://arrow.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=arrow/arrow-0.11.1/apache-arrow-0.11.1.tar.gz
description :
	 GObject Introspection files of Apache Arrow
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 apache-arrow
	 gettext
	 glib
conflicts :
patches :
EOF_patch :
install :
	 cd "c_glib" do
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
