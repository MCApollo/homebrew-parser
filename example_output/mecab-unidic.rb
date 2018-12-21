name :
	 MecabUnidic
homepage :
	 https://osdn.net/projects/unidic/
url :
	 https://dotsrc.dl.osdn.net/osdn/unidic/58338/unidic-mecab-2.1.2_src.zip
description :
	 Morphological analyzer for MeCab
build_deps :
link_deps :
	 mecab
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-dicdir=#{lib}/mecab/dic/unidic"
	 system "make", "install"
