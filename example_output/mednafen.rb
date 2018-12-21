name :
	 Mednafen
homepage :
	 https://mednafen.github.io/
url :
	 https://mednafen.github.io/releases/files/mednafen-1.21.3.tar.xz
description :
	 Multi-system emulator
build_deps :
	 pkg-config
link_deps :
	 gettext
	 libsndfile
	 :macos
	 sdl2
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"
