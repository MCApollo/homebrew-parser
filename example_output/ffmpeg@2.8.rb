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
optional_deps :
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
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 inreplace %w[libavdevice/v4l2.c libavutil/time.c], "HAVE_CLOCK_GETTIME",
	 "UNDEFINED_GIBBERISH"
	 end
	 args = %W[
	 --prefix=#{prefix}
	 --enable-shared
	 --enable-pthreads
	 --enable-gpl
	 --enable-version3
	 --enable-hardcoded-tables
	 --enable-avresample
	 --cc=#{ENV.cc}
	 --host-cflags=#{ENV.cflags}
	 --host-ldflags=#{ENV.ldflags}
	 --enable-ffplay
	 --enable-libmp3lame
	 --enable-libopus
	 --enable-libsnappy
	 --enable-libtheora
	 --enable-libvo-aacenc
	 --enable-libvorbis
	 --enable-libvpx
	 --enable-libx264
	 --enable-libx265
	 --enable-libxvid
	 ]
	 args << "--enable-opencl" if MacOS.version > :lion
	 args << "--enable-libfontconfig" if build.with? "fontconfig"
	 args << "--enable-libfreetype" if build.with? "freetype"
	 args << "--enable-librtmp" if build.with? "rtmpdump"
	 args << "--enable-libopencore-amrnb" << "--enable-libopencore-amrwb" if build.with? "opencore-amr"
	 args << "--enable-libfaac" if build.with? "faac"
	 args << "--enable-libass" if build.with? "libass"
	 args << "--enable-libssh" if build.with? "libssh"
	 args << "--enable-libspeex" if build.with? "speex"
	 args << "--enable-libschroedinger" if build.with? "schroedinger"
	 args << "--enable-libfdk-aac" if build.with? "fdk-aac"
	 args << "--enable-openssl" if build.with? "openssl"
	 args << "--enable-frei0r" if build.with? "frei0r"
	 args << "--enable-libcaca" if build.with? "libcaca"
	 args << "--enable-libsoxr" if build.with? "libsoxr"
	 args << "--enable-libquvi" if build.with? "libquvi"
	 args << "--enable-libvidstab" if build.with? "libvidstab"
	 args << "--enable-libwebp" if build.with? "webp"
	 args << "--enable-libzmq" if build.with? "zeromq"
	 args << "--enable-libbs2b" if build.with? "libbs2b"
	 args << "--enable-libdcadec" if build.with? "dcadec"
	 if build.with? "openjpeg"
	 args << "--enable-libopenjpeg"
	 args << "--disable-decoder=jpeg2000"
	 args << "--extra-cflags=" + `pkg-config --cflags libopenjpeg`.chomp
	 end
	 if %w[faac fdk-aac openssl].any? { |f| build.with? f }
	 args << "--enable-nonfree"
	 end
	 if MacOS.version < :yosemite || ENV.compiler == :clang
	 args << "--enable-vda"
	 else
	 args << "--disable-vda"
	 end
	 ENV.append_to_cflags "-mdynamic-no-pic" if Hardware::CPU.is_32_bit? && Hardware::CPU.intel? && ENV.compiler == :clang
	 system "./configure", *args
	 if MacOS.prefer_64_bit?
	 inreplace "config.mak" do |s|
	 shflags = s.get_make_var "SHFLAGS"
	 if shflags.gsub!(" -Wl,-read_only_relocs,suppress", "")
	 s.change_make_var! "SHFLAGS", shflags
	 end
	 end
	 end
	 system "make", "install"
	 system "make", "alltools"
	 bin.install Dir["tools/*"].select { |f| File.executable? f }
