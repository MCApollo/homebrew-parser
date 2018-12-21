name :
	 Dnsmap
homepage :
	 https://code.google.com/archive/p/dnsmap/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/dnsmap/dnsmap-0.30.tar.gz
description :
	 Passive DNS network mapper (a.k.a. subdomains bruteforcer)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}",
	 "BINDIR=#{bin}", "install"
