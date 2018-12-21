name :
	 Eg
homepage :
	 https://github.com/davep/eg
url :
	 https://github.com/davep/eg/archive/v1.02.tar.gz
description :
	 Expert Guide. Norton Guide Reader For GNU/Linux
build_deps :
link_deps :
	 s-lang
conflicts :
patches :
EOF_patch :
install :
	 inreplace "eglib.c", "/usr/share/", "#{etc}/"
	 bin.mkpath
	 man1.mkpath
	 system "make"
	 system "make", "install", "BINDIR=#{bin}", "MANDIR=#{man}", "NGDIR=#{etc}/norton-guides"
