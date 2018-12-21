name :
	 Libdv
homepage :
	 https://libdv.sourceforge.io
url :
	 https://downloads.sourceforge.net/libdv/libdv-1.0.0.tar.gz
description :
	 Codec for DV video encoding format
build_deps :
link_deps :
	 popt
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-undefined dynamic_lookup"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-gtktest",
	 "--disable-gtk",
	 "--disable-asm",
	 "--disable-sdltest"
	 system "make", "install"
