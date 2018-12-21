name :
	 Mp3splt
homepage :
	 https://mp3splt.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/mp3splt/mp3splt/2.6.2/mp3splt-2.6.2.tar.gz
description :
	 Command-line interface to split MP3 and Ogg Vorbis files
build_deps :
	 pkg-config
link_deps :
	 libmp3splt
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
