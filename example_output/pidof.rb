name :
	 Pidof
homepage :
	 http://www.nightproductions.net/cli.htm
url :
	 http://www.nightproductions.net/downloads/pidof_source.tar.gz
description :
	 Display the PID number for a given process name
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "all", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}"
	 man1.install gzip("pidof.1")
	 bin.install "pidof"
