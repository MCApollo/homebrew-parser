name :
	 Pwnat
homepage :
	 https://samy.pl/pwnat/
url :
	 https://samy.pl/pwnat/pwnat-0.3-beta.tgz
description :
	 Proxy server that works behind a NAT
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}", "LDFLAGS=-lz"
	 bin.install "pwnat"
