name :
	 Qtfaststart
homepage :
	 https://libav.org/
url :
	 https://libav.org/releases/libav-12.3.tar.gz
description :
	 Utility for Quicktime files
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['mov']
	 ['https://github.com/van7hu/fanca/raw/master/examples/kmplayer/samples/H264_test4_Talkingheadclipped_mov_480x320.mov']
patches :
EOF_patch :
install :
	 system ENV.cc, "-o", "tools/qt-faststart", "tools/qt-faststart.c"
	 bin.install "tools/qt-faststart"
