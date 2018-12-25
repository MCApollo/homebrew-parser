name :
	 Qmmp
homepage :
	 http://qmmp.ylsoftware.com/
url :
	 http://qmmp.ylsoftware.com/files/qmmp-1.2.4.tar.bz2
description :
	 Qt-based Multimedia Player
build_deps :
	 cmake
link_deps :
	 faad2
	 ffmpeg
	 flac
	 libbs2b
	 libmms
	 libogg
	 libsamplerate
	 libsndfile
	 libsoxr
	 libvorbis
	 mad
	 mplayer
	 musepack
	 opus
	 opusfile
	 qt
	 taglib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", "./", "-USE_SKINNED", "-USE_ENCA", "-USE_QMMP_DIALOG", *std_cmake_args
	 system "make", "install"
