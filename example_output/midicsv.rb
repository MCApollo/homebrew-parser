name :
	 Midicsv
homepage :
	 https://www.fourmilab.ch/webtools/midicsv
url :
	 https://www.fourmilab.ch/webtools/midicsv/midicsv-1.1.tar.gz
description :
	 Convert MIDI audio files to human-readable CSV format
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "check"
	 system "make", "install", "INSTALL_DEST=#{prefix}"
	 share.install prefix/"man"
