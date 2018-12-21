name :
	 Jumanpp
homepage :
	 http://nlp.ist.i.kyoto-u.ac.jp/EN/index.php?JUMAN%2B%2B
url :
	 https://lotus.kuee.kyoto-u.ac.jp/nl-resource/jumanpp/jumanpp-1.02.tar.xz
description :
	 Japanese Morphological Analyzer based on RNNLM
build_deps :
	 boost-build
link_deps :
	 boost
	 gperftools
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
