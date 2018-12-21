name :
	 Dgen
homepage :
	 https://dgen.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/dgen/dgen/1.33/dgen-sdl-1.33.tar.gz
description :
	 Sega Genesis / Mega Drive emulator
build_deps :
link_deps :
	 libarchive
	 sdl
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-silent-rules
	 --disable-dependency-tracking
	 --disable-sdltest
	 --prefix=#{prefix}
	 ]
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make", "install"
