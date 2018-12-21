name :
	 Rc
homepage :
	 http://doc.cat-v.org/plan_9/4th_edition/papers/rc
url :
	 ftp://rc.quanstro.net/pub/rc-1.7.2.tgz
description :
	 Implementation of the AT&T Plan 9 shell
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--with-editline"
	 system "make"
	 system "make", "install"
