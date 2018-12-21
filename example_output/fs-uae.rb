name :
	 FsUae
homepage :
	 https://fs-uae.net/
url :
	 https://fs-uae.net/stable/2.8.3/fs-uae-2.8.3.tar.gz
description :
	 Amiga emulator
build_deps :
	 pkg-config
link_deps :
	 freetype
	 gettext
	 glew
	 glib
	 libmpeg2
	 libpng
	 openal-soft
	 sdl2
conflicts :
patches :
EOF_patch :
install :
	 system "./bootstrap" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 mkdir "gen"
	 system "make"
	 system "make", "install"
	 (share/"applications").rmtree
	 (share/"icons").rmtree
	 (share/"mime").rmtree
