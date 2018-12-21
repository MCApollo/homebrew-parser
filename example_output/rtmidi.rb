name :
	 Rtmidi
homepage :
	 https://www.music.mcgill.ca/~gary/rtmidi/
url :
	 https://github.com/thestk/rtmidi/archive/v3.0.0.tar.gz
description :
	 C++ classes that provide a common API for realtime MIDI input/output
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh", "--no-configure"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 lib.install Dir[".libs/*.a", ".libs/*.dylib"]
	 include.install Dir["*.h"]
