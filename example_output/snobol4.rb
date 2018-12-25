name :
	 Snobol4
homepage :
	 http://www.snobol4.org/
url :
	 ftp://ftp.ultimate.com/snobol/snobol4-1.5.tar.gz
description :
	 String oriented and symbolic programming language
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
