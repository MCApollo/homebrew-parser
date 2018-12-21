name :
	 Portmidi
homepage :
	 https://sourceforge.net/projects/portmedia/
url :
	 https://downloads.sourceforge.net/project/portmedia/portmidi/217/portmidi-src-217.zip
description :
	 Cross-platform library for real-time MIDI I/O
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
