name :
	 Libxdiff
homepage :
	 http://www.xmailserver.org/xdiff-lib.html
url :
	 http://www.xmailserver.org/libxdiff-0.23.tar.gz
description :
	 Implements diff functions for binary and text files
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
