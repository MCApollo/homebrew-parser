name :
	 FluidSynth
homepage :
	 http://www.fluidsynth.org
url :
	 https://github.com/FluidSynth/fluidsynth/archive/v1.1.11.tar.gz
description :
	 Real-time software synthesizer based on the SoundFont 2 specs
build_deps :
	 cmake
	 pkg-config
link_deps :
	 glib
	 libsndfile
	 portaudio
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-Denable-framework=OFF" << "-DLIB_SUFFIX="
	 args << "-Denable-portaudio=ON" if build.with? "portaudio"
	 args << "-Denable-libsndfile=OFF" if build.without? "libsndfile"
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make", "install"
	 end
