name :
	 Libgxps
homepage :
	 https://wiki.gnome.org/Projects/libgxps
url :
	 https://download.gnome.org/sources/libgxps/0.2/libgxps-0.2.5.tar.xz
description :
	 GObject based library for handling and rendering XPS documents
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 cairo
	 freetype
	 jpeg
	 libarchive
	 libpng
	 libtiff
	 little-cms2
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --enable-man
	 ]
	 if build.head?
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
