name :
	 Advancemame
homepage :
	 https://www.advancemame.it/
url :
	 https://github.com/amadvance/advancemame/releases/download/v3.9/advancemame-3.9.tar.gz
description :
	 MAME with advanced video support
build_deps :
	 pkg-config
link_deps :
	 freetype
	 sdl
optional_deps :
conflicts :
	 advancemenu
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.delete "SDKROOT" if MacOS.version == :yosemite
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install", "LDFLAGS=#{ENV.ldflags}", "mandir=#{man}", "docdir=#{doc}"
