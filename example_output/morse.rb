name :
	 Morse
homepage :
	 http://www.catb.org/~esr/morse/
url :
	 http://www.catb.org/~esr/morse/morse-2.5.tar.gz
description :
	 Morse-code training program and QSO generator
build_deps :
link_deps :
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 system "make", "all", "DEVICE=X11"
	 bin.install "morse"
	 man1.install "morse.1"
