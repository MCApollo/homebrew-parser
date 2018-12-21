name :
	 Kakasi
homepage :
	 http://kakasi.namazu.org/
url :
	 http://kakasi.namazu.org/stable/kakasi-2.3.6.tar.gz
description :
	 Convert Kanji characters to Hiragana, Katakana, or Romaji
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
