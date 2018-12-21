name :
	 Cpmtools
homepage :
	 http://www.moria.de/~michael/cpmtools/
url :
	 http://www.moria.de/~michael/cpmtools/files/cpmtools-2.20.tar.gz
description :
	 Tools to access CP/M file systems
build_deps :
link_deps :
	 libdsk
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--with-libdsk"
	 bin.mkpath
	 man1.mkpath
	 man5.mkpath
	 system "make", "install"
