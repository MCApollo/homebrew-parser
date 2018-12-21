name :
	 Synfig
homepage :
	 https://synfig.org/
url :
	 https://downloads.sourceforge.net/project/synfig/releases/1.0.2/source/synfig-1.0.2.tar.gz
description :
	 Command-line renderer
build_deps :
	 pkg-config
link_deps :
	 boost
	 cairo
	 etl
	 freetype
	 gettext
	 libpng
	 libsigc++
	 libtool
	 libxml++
	 mlt
	 openexr
	 pango
conflicts :
patches :
	 https://gist.githubusercontent.com/tschoonj/06d5de3cdc5d063f8612/raw/26fe46b6eedeecdc686b9fd5aac01de9f2756424/synfig.diff
EOF_patch :
install :
	 ENV.cxx11
	 boost = Formula["boost"]
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-boost=#{boost.opt_prefix}",
	 "--without-jpeg"
	 system "make", "install"
