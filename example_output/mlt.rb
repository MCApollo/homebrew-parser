name :
	 Mlt
homepage :
	 https://www.mltframework.org/
url :
	 https://github.com/mltframework/mlt/archive/v6.12.0.tar.gz
description :
	 Author, manage, and run multitrack audio/video compositions
build_deps :
	 pkg-config
link_deps :
	 ffmpeg
	 frei0r
	 libdv
	 libsamplerate
	 libvorbis
	 sdl
	 sox
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-jackrack",
	 "--disable-swfdec",
	 "--disable-gtk",
	 "--enable-gpl"
	 system "make"
	 system "make", "install"
