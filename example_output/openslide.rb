name :
	 Openslide
homepage :
	 https://openslide.org/
url :
	 https://github.com/openslide/openslide/releases/download/v3.4.1/openslide-3.4.1.tar.xz
description :
	 C library to read whole-slide images (a.k.a. virtual slides)
build_deps :
	 pkg-config
link_deps :
	 cairo
	 gdk-pixbuf
	 glib
	 jpeg
	 libpng
	 libtiff
	 libxml2
	 openjpeg
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
