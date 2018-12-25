name :
	 Gpac
homepage :
	 https://gpac.wp.mines-telecom.fr/
url :
description :
	 Multimedia framework for research and academic purposes
build_deps :
	 pkg-config
link_deps :
	 openssl
optional_deps :
	 a52dec
	 faad2
	 ffmpeg
	 jpeg
	 libogg
	 libvorbis
	 mad
	 sdl
	 theora
	 :x11
conflicts :
	 bento4
resource :
	 []
	 []
patches :
	 https://github.com/gpac/gpac/commit/bceb03fd2be95097a7b409ea59914f332fb6bc86.patch?full_index=1
	 https://github.com/gpac/gpac/commit/b12b86e995db235e9a7e0c4fcd0fd54eb37bcee4.patch?full_index=1
	 https://github.com/gpac/gpac/commit/855aafe47677de558a7dd5f772b8094b54bfe61a.patch?full_index=1
EOF_patch :
install :
	 args = ["--disable-wx",
	 "--disable-pulseaudio",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"]
	 args << "--disable-x11" if build.without? "x11"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
