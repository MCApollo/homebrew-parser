name :
	 Libmp3splt
homepage :
	 https://mp3splt.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/mp3splt/libmp3splt/0.9.2/libmp3splt-0.9.2.tar.gz
description :
	 Utility library to split mp3, ogg, and FLAC files
build_deps :
	 pkg-config
link_deps :
	 flac
	 gettext
	 libid3tag
	 libogg
	 libtool
	 libvorbis
	 mad
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
