name :
	 Carla
homepage :
	 https://kxstudio.linuxaudio.org/Applications:Carla
url :
	 https://github.com/falkTX/Carla/archive/v1.9.12.tar.gz
description :
	 Audio plugin host supporting LADSPA, LV2, VST2/3, SF2 and more
build_deps :
	 pkg-config
link_deps :
	 fluid-synth
	 liblo
	 libmagic
	 pyqt
	 python
conflicts :
patches :
EOF_patch :
install :
	 args = []
	 if ENV.compiler == :clang && MacOS.version <= :mountain_lion
	 args << "MACOS_OLD=true"
