name :
	 Dwatch
homepage :
	 http://siag.nu/dwatch/
url :
	 http://siag.nu/pub/dwatch/dwatch-0.1.1.tar.gz
description :
	 Watch programs and perform actions based on a configuration file
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.mkpath
	 man1.mkpath
	 system "make", "install",
	 "CC=#{ENV.cc}",
	 "PREFIX=#{prefix}",
	 "MANDIR=#{man}",
	 "ETCDIR=#{etc}"
	 etc.install "dwatch.conf"
