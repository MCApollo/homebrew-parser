name :
	 Autobench
homepage :
	 http://www.xenoclast.org/autobench/
url :
	 http://www.xenoclast.org/autobench/downloads/autobench-2.1.2.tar.gz
description :
	 Automatic webserver benchmark tool
build_deps :
link_deps :
	 httperf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}",
	 "MANDIR=#{man1}",
	 "CC=#{ENV.cc}",
	 "CFLAGS=#{ENV.cflags}",
	 "install"
