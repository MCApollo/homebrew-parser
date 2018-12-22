name :
	 RtAudio
homepage :
	 https://www.music.mcgill.ca/~gary/rtaudio/
url :
	 https://www.music.mcgill.ca/~gary/rtaudio/release/rtaudio-5.0.0.tar.gz
description :
	 API for realtime audio input/output
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make"
	 lib.install "librtaudio_static.a", "librtaudio.dylib"
	 end
	 include.install "RtAudio.h", Dir["include/*"]
	 prefix.install "contrib", "tests"
	 doc.install Dir["doc/*"]
