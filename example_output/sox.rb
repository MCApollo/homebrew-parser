name :
	 Sox
homepage :
	 https://sox.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/sox/sox/14.4.2/sox-14.4.2.tar.gz
description :
	 SOund eXchange: universal sound sample translator
build_deps :
	 pkg-config
link_deps :
	 flac
	 lame
	 libpng
	 libvorbis
	 mad
optional_deps :
	 libao
	 libsndfile
	 opencore-amr
	 opusfile
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
