name :
	 Darkice
homepage :
	 http://www.darkice.org/
url :
	 https://downloads.sourceforge.net/project/darkice/darkice/1.3/darkice-1.3.tar.gz
description :
	 Live audio streamer
build_deps :
	 pkg-config
link_deps :
	 faac
	 jack
	 lame
	 libsamplerate
	 libvorbis
	 two-lame
conflicts :
patches :
EOF_patch :
install :
	 ["aacPlusEncoder.cpp", "FaacEncoder.cpp", "OpusLibEncoder.cpp", "VorbisLibEncoder.cpp"].each do |f|
	 inreplace "src/#{f}", ", converterData.data_in", ", const_cast<float*>( converterData.data_in )"
