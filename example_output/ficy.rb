name :
	 Ficy
homepage :
	 https://www.thregr.org/~wavexx/software/fIcy/
url :
	 https://www.thregr.org/~wavexx/software/fIcy/releases/fIcy-1.0.21.tar.gz
description :
	 Icecast/Shoutcast stream grabber suite
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "fIcy", "fPls", "fResync"
