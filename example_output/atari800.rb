name :
	 Atari800
homepage :
	 https://atari800.github.io/
url :
	 https://downloads.sourceforge.net/project/atari800/atari800/4.0.0/atari800-4.0.0.tar.gz
description :
	 Atari 8-bit machine emulator
build_deps :
link_deps :
	 libpng
	 sdl
conflicts :
patches :
EOF_patch :
install :
	 cd "src" do
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-sdltest"
	 system "make", "install"
