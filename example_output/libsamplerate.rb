name :
	 Libsamplerate
homepage :
	 http://www.mega-nerd.com/SRC
url :
	 http://www.mega-nerd.com/SRC/libsamplerate-0.1.9.tar.gz
description :
	 Library for sample rate conversion of audio data
build_deps :
	 pkg-config
link_deps :
	 fftw
	 libsndfile
conflicts :
patches :
EOF_patch :
	 --- a/examples/audio_out.c	2011-07-12 16:57:31.000000000 -0700
	 +++ b/examples/audio_out.c	2012-03-11 20:48:57.000000000 -0700
	 @@ -168,7 +168,7 @@
	 #if (defined (__MACH__) && defined (__APPLE__)) /* MacOSX */
	 -#include <Carbon.h>
	 +#include <Carbon/Carbon.h>
	 #include <CoreAudio/AudioHardware.h>
	 #define	MACOSX_MAGIC	MAKE_MAGIC ('M', 'a', 'c', ' ', 'O', 'S', ' ', 'X')
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 rm_f "#{bin}/sndfile-resample" if build.without? "libsndfile"
