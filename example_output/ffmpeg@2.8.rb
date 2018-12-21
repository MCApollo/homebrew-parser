name :
	 FfmpegAT28
homepage :
	 https://ffmpeg.org/
url :
	 https://ffmpeg.org/releases/ffmpeg-2.8.15.tar.bz2
description :
	 Play, record, convert, and stream audio and video
build_deps :
	 pkg-config
	 texi2html
	 yasm
link_deps :
	 lame
	 libvo-aacenc
	 libvorbis
	 libvpx
	 opus
	 sdl
	 snappy
	 theora
	 x264
	 x265
	 xvid
	 dcadec
	 faac
	 fdk-aac
	 fontconfig
	 freetype
	 frei0r
	 libass
	 libbluray
	 libbs2b
	 libcaca
	 libquvi
	 libsoxr
	 libssh
	 libvidstab
	 opencore-amr
	 openjpeg
	 openssl
	 rtmpdump
	 schroedinger
	 speex
	 webp
	 zeromq
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 inreplace %w[libavdevice/v4l2.c libavutil/time.c], "HAVE_CLOCK_GETTIME",
	 "UNDEFINED_GIBBERISH"
