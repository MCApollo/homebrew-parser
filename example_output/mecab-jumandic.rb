name :
	 MecabJumandic
homepage :
	 https://taku910.github.io/mecab/
url :
	 https://www.mirrorservice.org/sites/distfiles.macports.org/mecab/mecab-jumandic-7.0-20130310.tar.gz
description :
	 See mecab
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
	 --with-dicdir=#{lib}/mecab/dic/jumandic
	 ]
	 system "./configure", *args
	 system "make", "install"
