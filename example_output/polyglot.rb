name :
	 Polyglot
homepage :
	 https://chessprogramming.wikispaces.com/PolyGlot
url :
	 http://hgm.nubati.net/releases/polyglot-2.0.4.tar.gz
description :
	 Protocol adapter to run UCI engines under XBoard
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
