name :
	 Vorbisgain
homepage :
	 https://sjeng.org/vorbisgain.html
url :
	 https://sjeng.org/ftp/vorbis/vorbisgain-0.37.tar.gz
description :
	 Add Replay Gain volume tags to Ogg Vorbis files
build_deps :
link_deps :
	 libogg
	 libvorbis
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
