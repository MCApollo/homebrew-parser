name :
	 Makepp
homepage :
	 https://makepp.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/makepp/2.0/makepp-2.0.tgz
description :
	 Drop-in replacement for GNU make
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
