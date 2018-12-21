name :
	 Dosbox
homepage :
	 https://www.dosbox.com/
url :
	 https://downloads.sourceforge.net/project/dosbox/dosbox/0.74-2/dosbox-0.74-2.tar.gz
description :
	 DOS Emulator
build_deps :
link_deps :
	 libpng
	 ncurses
	 sdl
	 sdl_net
	 sdl_sound
conflicts :
	 dosbox-x
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --disable-sdltest
	 --enable-core-inline
	 ]
	 args << "--enable-debug" if build.with? "debugger"
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make", "install"
