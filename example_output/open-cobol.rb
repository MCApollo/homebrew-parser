name :
	 OpenCobol
homepage :
	 https://sourceforge.net/projects/open-cobol/
url :
	 https://downloads.sourceforge.net/project/open-cobol/open-cobol/1.1/open-cobol-1.1.tar.gz
description :
	 COBOL compiler
build_deps :
link_deps :
	 berkeley-db
	 gmp
conflicts :
	 gnu-cobol
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--infodir=#{info}"
	 system "make", "install"
