name :
	 Mp3blaster
homepage :
	 https://mp3blaster.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/mp3blaster/mp3blaster/mp3blaster-3.2.6/mp3blaster-3.2.6.tar.gz
description :
	 Text-based mp3 player
build_deps :
link_deps :
	 sdl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
