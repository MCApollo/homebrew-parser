name :
	 OpenalSoft
homepage :
	 https://openal-soft.org/
url :
	 https://openal-soft.org/openal-releases/openal-soft-1.18.2.tar.bz2
description :
	 Implementation of the OpenAL 3D audio API
build_deps :
	 cmake
	 pkg-config
link_deps :
optional_deps :
	 fluid-synth
	 portaudio
	 pulseaudio
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DALSOFT_EXAMPLES=OFF"
	 args << "-DALSOFT_BACKEND_PORTAUDIO=OFF" if build.without? "portaudio"
	 args << "-DALSOFT_BACKEND_PULSEAUDIO=OFF" if build.without? "pulseaudio"
	 args << "-DALSOFT_MIDI_FLUIDSYNTH=OFF" if build.without? "fluid-synth"
	 system "cmake", ".", *args
	 system "make", "install"
