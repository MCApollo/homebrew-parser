name :
	 Mpd
homepage :
	 https://www.musicpd.org/
url :
	 https://www.musicpd.org/download/mpd/0.21/mpd-0.21.3.tar.xz
description :
	 Music Player Daemon
build_deps :
	 boost
	 meson
	 ninja
	 pkg-config
link_deps :
	 expat
	 faad2
	 ffmpeg
	 flac
	 fluid-synth
	 glib
	 icu4c
	 lame
	 libao
	 libid3tag
	 libmpdclient
	 libsamplerate
	 libupnp
	 libvorbis
	 opus
	 sqlite
conflicts :
patches :
EOF_patch :
install :
	 ENV.libcxx
	 args = %W[
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}
	 -Dlibwrap=disabled
	 -Dmad=disabled
	 -Dmpcdec=disabled
	 -Dsoundcloud=disabled
	 -Dao=enabled
	 -Dbzip2=enabled
	 -Dexpat=enabled
	 -Dffmpeg=enabled
	 -Dfluidsynth=enabled
	 -Dupnp=enabled
	 -Dvorbisenc=enabled
	 ]
	 system "meson", *args, "output/release", "."
	 system "ninja", "-C", "output/release"
	 ENV.deparallelize
	 system "ninja", "-C", "output/release", "install"
	 (etc/"mpd").install "doc/mpdconf.example" => "mpd.conf"
