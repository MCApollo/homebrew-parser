name :
	 Webalizer
homepage :
	 http://www.webalizer.org
url :
	 ftp://ftp.mrunix.net/pub/webalizer/webalizer-2.23-08-src.tgz
description :
	 Web server log file analysis
build_deps :
link_deps :
	 berkeley-db
	 gd
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
