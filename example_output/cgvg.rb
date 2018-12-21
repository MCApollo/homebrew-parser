name :
	 Cgvg
homepage :
	 http://www.uzix.org/cgvg.html
url :
	 http://www.uzix.org/cgvg/cgvg-1.6.3.tar.gz
description :
	 Command-line source browsing tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
