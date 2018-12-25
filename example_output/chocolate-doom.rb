name :
	 ChocolateDoom
homepage :
	 https://www.chocolate-doom.org/
url :
	 https://www.chocolate-doom.org/downloads/3.0.0/chocolate-doom-3.0.0.tar.gz
description :
	 Accurate source port of Doom
build_deps :
	 pkg-config
link_deps :
	 libpng
	 libsamplerate
	 sdl2
	 sdl2_mixer
	 sdl2_net
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--disable-sdltest"
	 system "make", "install", "execgamesdir=#{bin}"
	 (share/"applications").rmtree
	 (share/"icons").rmtree
