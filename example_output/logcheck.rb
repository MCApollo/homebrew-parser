name :
	 Logcheck
homepage :
	 https://packages.debian.org/sid/logcheck
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/l/logcheck/logcheck_1.3.19.tar.xz
description :
	 Mail anomalies in the system logfiles to the administrator
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile", "$(DESTDIR)/$(CONFDIR)", "$(CONFDIR)"
	 system "make", "install", "--always-make", "DESTDIR=#{prefix}",
	 "SBINDIR=sbin", "BINDIR=bin", "CONFDIR=#{etc}/logcheck"
