name :
	 Surfraw
homepage :
	 https://packages.debian.org/sid/surfraw
url :
	 https://ftp.openbsd.org/pub/OpenBSD/distfiles/surfraw-2.3.0.tar.gz
description :
	 Shell Users' Revolutionary Front Rage Against the Web
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--with-graphical-browser=open"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
