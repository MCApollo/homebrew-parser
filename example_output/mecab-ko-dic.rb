name :
	 MecabKoDic
homepage :
	 https://bitbucket.org/eunjeon/mecab-ko-dic
url :
	 https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-1.6.1-20140814.tar.gz
description :
	 See mecab
build_deps :
	 autoconf
	 automake
link_deps :
	 mecab-ko
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}",
	 "--with-dicdir=#{lib}/mecab/dic/mecab-ko-dic"
	 system "make", "install"
