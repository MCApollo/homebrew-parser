name :
	 Ffmpeg
homepage :
	 https://ffmpeg.org/
url :
	 https://ffmpeg.org/releases/ffmpeg-4.1.tar.xz
description :
	 Play, record, convert, and stream audio and video
build_deps :
	 nasm
	 pkg-config
	 texi2html
link_deps :
	 lame
	 libvorbis
	 libvpx
	 opus
	 sdl2
	 snappy
	 theora
	 x264
	 x265
	 xvid
	 xz
optional_deps :
	 aom
	 chromaprint
	 fdk-aac
	 fontconfig
	 freetype
	 frei0r
	 game-music-emu
	 libass
	 libbluray
	 libbs2b
	 libcaca
	 libgsm
	 libmodplug
	 librsvg
	 libsoxr
	 libssh
	 libvidstab
	 libvmaf
	 opencore-amr
	 openh264
	 openjpeg
	 openssl
	 rtmpdump
	 rubberband
	 speex
	 srt
	 tesseract
	 two-lame
	 wavpack
	 webp
	 zeromq
	 zimg
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --enable-shared
	 --enable-pthreads
	 --enable-version3
	 --enable-hardcoded-tables
	 --enable-avresample
	 --cc=#{ENV.cc}
	 --host-cflags=#{ENV.cflags}
	 --host-ldflags=#{ENV.ldflags}
	 --enable-ffplay
	 --enable-gpl
	 --enable-libmp3lame
	 --enable-libopus
	 --enable-libsnappy
	 --enable-libtheora
	 --enable-libvorbis
	 --enable-libvpx
	 --enable-libx264
	 --enable-libx265
	 --enable-libxvid
	 --enable-lzma
	 ]
	 args << "--enable-chromaprint" if build.with? "chromaprint"
	 args << "--enable-frei0r" if build.with? "frei0r"
	 args << "--enable-libaom" if build.with? "aom"
	 args << "--enable-libass" if build.with? "libass"
	 args << "--enable-libbluray" if build.with? "libbluray"
	 args << "--enable-libbs2b" if build.with? "libbs2b"
	 args << "--enable-libcaca" if build.with? "libcaca"
	 args << "--enable-libfdk-aac" if build.with? "fdk-aac"
	 args << "--enable-libfontconfig" if build.with? "fontconfig"
	 args << "--enable-libfreetype" if build.with? "freetype"
	 args << "--enable-libgme" if build.with? "game-music-emu"
	 args << "--enable-libgsm" if build.with? "libgsm"
	 args << "--enable-libmodplug" if build.with? "libmodplug"
	 args << "--enable-libopencore-amrnb" << "--enable-libopencore-amrwb" if build.with? "opencore-amr"
	 args << "--enable-libopenh264" if build.with? "openh264"
	 args << "--enable-librsvg" if build.with? "librsvg"
	 args << "--enable-librtmp" if build.with? "rtmpdump"
	 args << "--enable-librubberband" if build.with? "rubberband"
	 args << "--enable-libsoxr" if build.with? "libsoxr"
	 args << "--enable-libspeex" if build.with? "speex"
	 args << "--enable-libsrt" if build.with? "srt"
	 args << "--enable-libssh" if build.with? "libssh"
	 args << "--enable-libtesseract" if build.with? "tesseract"
	 args << "--enable-libtwolame" if build.with? "two-lame"
	 args << "--enable-libvidstab" if build.with? "libvidstab"
	 args << "--enable-libvmaf" if build.with? "libvmaf"
	 args << "--enable-libwavpack" if build.with? "wavpack"
	 args << "--enable-libwebp" if build.with? "webp"
	 args << "--enable-libzimg" if build.with? "zimg"
	 args << "--enable-libzmq" if build.with? "zeromq"
	 args << "--enable-opencl" if MacOS.version > :lion
	 args << "--enable-openssl" if build.with? "openssl"
	 args << "--enable-videotoolbox" if MacOS.version >= :mountain_lion
	 if build.with? "openjpeg"
	 args << "--enable-libopenjpeg"
	 args << "--disable-decoder=jpeg2000"
	 args << "--extra-cflags=" + `pkg-config --cflags libopenjp2`.chomp
	 end
	 args << "--enable-nonfree" if build.with?("fdk-aac") || build.with?("openssl")
	 system "./configure", *args
	 system "make", "install"
	 system "make", "alltools"
	 bin.install Dir["tools/*"].select { |f| File.executable? f }
