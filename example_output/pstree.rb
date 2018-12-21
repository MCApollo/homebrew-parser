name :
	 Pstree
homepage :
	 http://www.thp.uni-duisburg.de/pstree/
url :
	 ftp://ftp.thp.uni-duisburg.de/pub/source/pstree-2.39.tar.gz
description :
	 Show ps output as a tree
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "pstree"
	 bin.install "pstree"
	 man1.install "pstree.1"
