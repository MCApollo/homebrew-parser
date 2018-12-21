name :
	 Ocp
homepage :
	 https://sourceforge.net/projects/opencubicplayer/
url :
	 https://downloads.sourceforge.net/project/opencubicplayer/ocp-0.1.21/ocp-0.1.21.tar.bz2
description :
	 UNIX port of the Open Cubic Player
build_deps :
link_deps :
	 flac
	 libvorbis
	 mad
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 args = %W[
	 --prefix=#{prefix}
	 --without-x11
	 --without-sdl
	 --without-desktop_file_install
	 ]
	 system "./configure", *args
	 system "make"
	 system "make", "install"
