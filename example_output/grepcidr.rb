name :
	 Grepcidr
homepage :
	 http://www.pc-tools.net/unix/grepcidr/
url :
	 http://www.pc-tools.net/files/unix/grepcidr-2.0.tar.gz
description :
	 Filter IP addresses matching IPv4 CIDR/network specification
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "grepcidr"
	 man1.install "grepcidr.1"
