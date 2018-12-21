name :
	 MecabIpadic
homepage :
	 https://taku910.github.io/mecab/
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/m/mecab-ipadic/mecab-ipadic_2.7.0-20070801+main.orig.tar.gz
description :
	 IPA dictionary compiled for MeCab
build_deps :
link_deps :
	 mecab
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --with-charset=utf8
	 --with-dicdir=#{lib}/mecab/dic/ipadic
	 ]
	 system "./configure", *args
	 system "make", "install"
