name :
	 MecabUnidicExtended
homepage :
	 https://osdn.net/projects/unidic/
url :
	 https://dotsrc.dl.osdn.net/osdn/unidic/58338/unidic-mecab_kana-accent-2.1.2_src.zip
description :
	 Extended morphological analyzer for MeCab
build_deps :
link_deps :
	 mecab
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-dicdir=#{lib}/mecab/dic/unidic-extended"
	 system "make", "install"
