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
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
