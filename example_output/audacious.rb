name :
	 Audacious
homepage :
	 https://audacious-media-player.org/
url :
	 https://distfiles.audacious-media-player.org/audacious-3.9.tar.bz2
description :
	 Free and advanced audio player based on GTK+
build_deps :
	 autoconf
	 automake
	 libtool
	 gettext
	 make
	 pkg-config
link_deps :
	 faad2
	 ffmpeg
	 flac
	 fluid-synth
	 glib
	 lame
	 libbs2b
	 libcue
	 libnotify
	 libsamplerate
	 libsoxr
	 libvorbis
	 mpg123
	 neon
	 python@2
	 qt
	 sdl2
	 wavpack
conflicts :
patches :
	 https://github.com/audacious-media-player/audacious-plugins/pull/62.patch?full_index=1
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-coreaudio
	 --disable-gtk
	 --disable-mpris2
	 --enable-mac-media-keys
	 --enable-qt
	 ]
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 resource("plugins").stage do
	 ENV.prepend_path "PKG_CONFIG_PATH", "#{lib}/pkgconfig"
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make"
	 system "make", "install"
