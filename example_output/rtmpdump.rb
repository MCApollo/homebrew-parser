name :
	 Rtmpdump
homepage :
	 https://rtmpdump.mplayerhq.hu/
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/r/rtmpdump/rtmpdump_2.4+20151223.gitfa8646d.1.orig.tar.gz
description :
	 Tool for downloading RTMP streaming media
build_deps :
link_deps :
	 openssl
conflicts :
	 flvstreamer
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "make", "CC=#{ENV.cc}",
	 "XCFLAGS=#{ENV.cflags}",
	 "XLDFLAGS=#{ENV.ldflags}",
	 "MANDIR=#{man}",
	 "SYS=darwin",
	 "prefix=#{prefix}",
	 "sbindir=#{bin}",
	 "install"
