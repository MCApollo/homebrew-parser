name :
	 Smpeg2
homepage :
	 https://icculus.org/smpeg/
url :
	 408
description :
	 SDL MPEG Player Library
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 sdl2
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}",
	 "--with-sdl-prefix=#{Formula["sdl2"].opt_prefix}",
	 "--disable-dependency-tracking",
	 "--disable-debug",
	 "--disable-sdltest"
	 system "make"
	 system "make", "install"
	 mv "#{bin}/plaympeg", "#{bin}/plaympeg2"
	 mv "#{man1}/plaympeg.1", "#{man1}/plaympeg2.1"
