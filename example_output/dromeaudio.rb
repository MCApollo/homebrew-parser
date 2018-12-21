name :
	 Dromeaudio
homepage :
	 https://github.com/joshb/dromeaudio/
url :
	 https://github.com/joshb/DromeAudio/archive/v0.3.0.tar.gz
description :
	 Small C++ audio manipulation and playback library
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "share/CMakeLists.txt", "${CMAKE_ROOT}", "#{share}/cmake"
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
