name :
	 Babl
homepage :
	 http://www.gegl.org/babl/
url :
	 https://download.gimp.org/pub/babl/0.1/babl-0.1.56.tar.bz2
description :
	 Dynamic, any-to-any, pixel format translation library
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
