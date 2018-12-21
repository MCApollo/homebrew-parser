name :
	 GnomeDocUtils
homepage :
	 https://wiki.gnome.org/Projects/GnomeDocUtils
url :
	 https://download.gnome.org/sources/gnome-doc-utils/0.20/gnome-doc-utils-0.20.10.tar.xz
description :
	 Documentation utilities for the GNOME project
build_deps :
	 intltool
	 pkg-config
link_deps :
	 docbook
	 gettext
	 libxml2
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 ENV.append_path "PYTHONPATH", "#{Formula["libxml2"].opt_lib}/python2.7/site-packages"
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-scrollkeeper",
	 "--enable-build-utils=yes"
	 system "make"
	 system "make", "install"
