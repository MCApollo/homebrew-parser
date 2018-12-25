name :
	 Sersniff
homepage :
	 https://www.earth.li/projectpurple/progs/sersniff.html
url :
	 https://www.earth.li/projectpurple/files/sersniff-0.0.5.tar.gz
description :
	 Program to tunnel/sniff between 2 serial ports
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "sersniff"
	 man8.install "sersniff.8"
