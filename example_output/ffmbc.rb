name :
	 Ffmbc
homepage :
	 https://code.google.com/p/ffmbc/
url :
	 https://github.com/darealshinji/ffmbc/archive/v0.7.2.tar.gz
description :
	 FFmpeg customized for broadcast and professional usage
build_deps :
	 texi2html
	 yasm
link_deps :
	 faac
	 lame
	 libvorbis
	 theora
	 x264
	 xvid
conflicts :
patches :
EOF_patch :
	 diff --git a/doc/texi2pod.pl b/doc/texi2pod.pl
	 index 18531be..88b0a3f 100755
	 --- a/doc/texi2pod.pl
	 +++ b/doc/texi2pod.pl
	 @@ -297,6 +297,8 @@ $inf = pop @instack;
	 die "No filename or title\n" unless defined $fn && defined $tl;
	 +print "=encoding utf8\n\n";
	 +
	 $sects{NAME} = "$fn \- $tl\n";
	 $sects{FOOTNOTES} .= "=back\n" if exists $sects{FOOTNOTES};
install :
	 args = %W[
	 --prefix=#{prefix}
	 --cc=#{ENV.cc}
	 --disable-debug
	 --disable-indev=jack
	 --disable-shared
	 --enable-gpl
	 --enable-libfaac
	 --enable-libmp3lame
	 --enable-libtheora
	 --enable-libvorbis
	 --enable-libx264
	 --enable-libxvid
	 --enable-nonfree
	 ]
	 system "./configure", *args
	 system "make"
	 mv "ffprobe", "ffprobe-bc"
	 mv "doc/ffprobe.1", "doc/ffprobe-bc.1"
	 bin.install "ffmbc", "ffprobe-bc"
	 man.mkpath
	 man1.install "doc/ffmbc.1", "doc/ffprobe-bc.1"
