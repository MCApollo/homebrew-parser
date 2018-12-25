name :
	 Unzip
homepage :
	 https://infozip.sourceforge.io/UnZip.html
url :
	 https://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz
description :
	 Extraction utility for .zip compressed archives
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/u/unzip/unzip_6.0-21.debian.tar.xz
EOF_patch :
install :
	 system "make", "-f", "unix/Makefile",
	 "CC=#{ENV.cc}",
	 "LOC=-DLARGE_FILE_SUPPORT",
	 "D_USE_BZ2=-DUSE_BZIP2",
	 "L_BZ2=-lbz2",
	 "macosx",
	 "LFLAGS1=-liconv"
	 system "make", "prefix=#{prefix}", "MANDIR=#{man1}", "install"
