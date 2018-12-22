name :
	 Sec
homepage :
	 https://simple-evcorr.sourceforge.io/
url :
	 https://github.com/simple-evcorr/sec/releases/download/2.8.1/sec-2.8.1.tar.gz
description :
	 Event correlation tool for event processing of various kinds
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "sec"
	 man1.install "sec.man" => "sec.1"
