name :
	 Babeld
homepage :
	 https://www.irif.univ-paris-diderot.fr/~jch/software/babel/
url :
	 https://www.irif.univ-paris-diderot.fr/~jch/software/files/babeld-1.8.2.tar.gz
description :
	 Loop-avoiding distance-vector routing protocol
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "LDLIBS=''"
	 system "make", "install", "PREFIX=#{prefix}"
