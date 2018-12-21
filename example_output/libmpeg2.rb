name :
	 Libmpeg2
homepage :
	 https://libmpeg2.sourceforge.io/
url :
	 https://libmpeg2.sourceforge.io/files/libmpeg2-0.5.1.tar.gz
description :
	 Library to decode mpeg-2 and mpeg-1 video streams
build_deps :
link_deps :
	 sdl
conflicts :
patches :
EOF_patch :
install :
	 ENV.append_to_cflags "-std=gnu89"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
