name :
	 Ptunnel
homepage :
	 https://www.cs.uit.no/~daniels/PingTunnel/
url :
	 https://www.cs.uit.no/~daniels/PingTunnel/PingTunnel-0.72.tar.gz
description :
	 Tunnel over ICMP
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "prefix=#{prefix}"
