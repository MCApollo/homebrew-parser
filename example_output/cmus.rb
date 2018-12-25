name :
	 Cmus
homepage :
	 https://cmus.github.io/
url :
	 https://github.com/cmus/cmus/archive/v2.7.1.tar.gz
description :
	 Music player with an ncurses based interface
build_deps :
	 pkg-config
link_deps :
	 faad2
	 flac
	 libao
	 libcue
	 libogg
	 libvorbis
	 mad
	 mp4v2
optional_deps :
	 ffmpeg
	 jack
	 opusfile
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "prefix=#{prefix}", "mandir=#{man}"
	 system "make", "install"
