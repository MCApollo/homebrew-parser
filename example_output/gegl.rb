name :
	 Gegl
homepage :
	 http://www.gegl.org/
url :
	 https://download.gimp.org/pub/gegl/0.4/gegl-0.4.8.tar.bz2
description :
	 Graph based image processing framework
build_deps :
	 intltool
	 pkg-config
link_deps :
	 babl
	 gettext
	 glib
	 jpeg
	 json-glib
	 libpng
optional_deps :
conflicts :
	 coreutils
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-docs",
	 "--without-cairo",
	 "--without-jasper",
	 "--without-umfpack"
	 system "make", "install"
