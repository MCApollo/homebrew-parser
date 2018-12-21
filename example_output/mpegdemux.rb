name :
	 Mpegdemux
homepage :
	 http://www.hampa.ch/mpegdemux/
url :
	 http://www.hampa.ch/mpegdemux/mpegdemux-0.1.4.tar.gz
description :
	 MPEG1/2 system stream demultiplexer
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
