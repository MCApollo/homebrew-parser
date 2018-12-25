name :
	 Tin
homepage :
	 http://www.tin.org
url :
	 http://ftp.cuhk.edu.hk/pub/packages/news/tin/v2.4/tin-2.4.2.tar.gz
description :
	 Threaded, NNTP-, and spool-based UseNet newsreader
build_deps :
link_deps :
optional_deps :
conflicts :
	 mutt
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "build"
	 system "make", "install"
