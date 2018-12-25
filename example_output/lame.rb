name :
	 Lame
homepage :
	 https://lame.sourceforge.io/
url :
	 https://downloads.sourceforge.net/sourceforge/lame/lame-3.100.tar.gz
description :
	 High quality MPEG Audio Layer III (MP3) encoder
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "include/libmp3lame.sym", "lame_init_old\n", ""
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-debug",
	 "--prefix=#{prefix}",
	 "--enable-nasm"
	 system "make", "install"
