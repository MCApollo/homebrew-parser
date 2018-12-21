name :
	 Juman
homepage :
	 http://nlp.ist.i.kyoto-u.ac.jp/index.php?JUMAN
url :
	 http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/juman-7.01.tar.bz2
description :
	 Japanese morphological analysis system
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
