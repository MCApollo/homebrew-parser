name :
	 Dhcpdump
homepage :
	 https://www.mavetju.org/
url :
	 https://www.mavetju.org/download/dhcpdump-1.8.tar.gz
description :
	 Monitor DHCP traffic for debugging purposes
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "dhcpdump"
	 man8.install "dhcpdump.8"
