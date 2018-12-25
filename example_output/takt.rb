name :
	 Takt
homepage :
	 https://takt.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/takt/takt-0.310-src.tar.gz
description :
	 Text-based music programming language
build_deps :
link_deps :
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--with-lispdir=#{elisp}"
	 system "make", "install"
