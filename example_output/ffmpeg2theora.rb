name :
	 Ffmpeg2theora
homepage :
	 https://v2v.cc/~j/ffmpeg2theora/
url :
	 https://v2v.cc/~j/ffmpeg2theora/downloads/ffmpeg2theora-0.30.tar.bz2
description :
	 Convert video files to Ogg Theora format
build_deps :
	 pkg-config
	 scons
link_deps :
	 ffmpeg
	 libogg
	 libvorbis
	 theora
optional_deps :
	 libkate
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = [
	 "prefix=#{prefix}",
	 "mandir=PREFIX/share/man",
	 "APPEND_LINKFLAGS=-headerpad_max_install_names",
	 ]
	 scons "install", *args
