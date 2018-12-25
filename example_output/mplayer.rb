name :
	 Mplayer
homepage :
	 https://mplayerhq.hu/
url :
	 https://mplayerhq.hu/MPlayer/releases/MPlayer-1.3.0.tar.xz
description :
	 UNIX movie player
build_deps :
	 yasm
link_deps :
	 pkg-config
optional_deps :
	 libcaca
	 libdvdnav
	 libdvdread
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/configure b/configure
	 index addc461..3b871aa 100755
	 --- a/configure
	 +++ b/configure
	 @@ -1517,8 +1517,6 @@ if test -e ffmpeg/mp_auto_pull ; then
	 fi
	 if test "$ffmpeg_a" != "no" && ! test -e ffmpeg ; then
	 -    echo "No FFmpeg checkout, press enter to download one with git or CTRL+C to abort"
	 -    read tmp
	 if ! git clone -b $FFBRANCH --depth 1 git://source.ffmpeg.org/ffmpeg.git ffmpeg ; then
	 rm -rf ffmpeg
	 echo "Failed to get a FFmpeg checkout"
install :
	 args = %W[
	 --cc=#{ENV.cc}
	 --host-cc=#{ENV.cc}
	 --disable-cdparanoia
	 --prefix=#{prefix}
	 --disable-x11
	 ]
	 args << "--enable-caca" if build.with? "libcaca"
	 args << "--enable-dvdnav" if build.with? "libdvdnav"
	 if build.with? "libdvdread"
	 ENV["LDFLAGS"] = "-L#{Formula["libdvdread"].opt_lib} -ldvdread"
	 args << "--enable-dvdread"
	 end
	 system "./configure", *args
	 system "make"
	 system "make", "install"
