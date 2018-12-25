name :
	 Espeak
homepage :
	 https://espeak.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/espeak/espeak/espeak-1.48/espeak-1.48.04-source.zip
description :
	 Text to speech, software speech synthesizer
build_deps :
link_deps :
	 portaudio
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 share.install "espeak-data"
	 doc.install Dir["docs/*"]
	 cd "src" do
	 rm "portaudio.h"
	 inreplace "Makefile", "SONAME_OPT=-Wl,-soname,", "SONAME_OPT=-Wl,-install_name,"
	 inreplace "speech.h", "#define USE_ASYNC", "//#define USE_ASYNC"
	 system "make", "speak", "DATADIR=#{share}/espeak-data", "PREFIX=#{prefix}"
	 bin.install "speak" => "espeak"
	 system "make", "libespeak.a", "DATADIR=#{share}/espeak-data", "PREFIX=#{prefix}"
	 lib.install "libespeak.a"
	 system "make", "libespeak.so", "DATADIR=#{share}/espeak-data", "PREFIX=#{prefix}"
	 lib.install "libespeak.so.1.1.48" => "libespeak.dylib"
	 MachO::Tools.change_dylib_id("#{lib}/libespeak.dylib", "#{lib}/libespeak.dylib")
	 end
