name :
	 FuseEmulator
homepage :
	 https://fuse-emulator.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/fuse-emulator/fuse/1.5.5/fuse-1.5.5.tar.gz
description :
	 Free Unix Spectrum Emulator
build_deps :
	 pkg-config
link_deps :
	 libpng
	 libspectrum
	 sdl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-sdltest",
	 "--with-sdl",
	 "--prefix=#{prefix}"
	 system "make", "install"
