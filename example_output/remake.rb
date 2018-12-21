name :
	 Remake
homepage :
	 https://bashdb.sourceforge.io/remake
url :
	 https://downloads.sourceforge.net/project/bashdb/remake/4.2%2Bdbg-1.4/remake-4.2.1%2Bdbg-1.4.tar.bz2
description :
	 GNU Make with improved error handling, tracing, and a debugger
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
