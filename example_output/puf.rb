name :
	 Puf
homepage :
	 https://puf.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/puf/puf/1.0.0/puf-1.0.0.tar.gz
description :
	 Parallel URL fetcher
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
