name :
	 Smpeg
homepage :
	 https://icculus.org/smpeg/
url :
	 399
description :
	 SDL MPEG Player Library
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 sdl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --with-sdl-prefix=#{Formula["sdl"].opt_prefix}
	 --disable-dependency-tracking
	 --disable-debug
	 --disable-gtk-player
	 --disable-gtktest
	 --disable-opengl-player
	 --disable-sdltest
	 ]
	 system "./autogen.sh"
	 system "./configure", *args
	 system "make"
	 chmod 0755, "./install-sh"
	 system "make", "install"
	 rm_f "#{man1}/gtv.1"
