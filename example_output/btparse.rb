name :
	 Btparse
homepage :
	 https://www.gerg.ca/software/btOOL/
url :
	 https://www.gerg.ca/software/btOOL/btparse-0.34.tar.gz
description :
	 BibTeX utility libraries
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
