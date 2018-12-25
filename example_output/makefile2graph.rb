name :
	 Makefile2graph
homepage :
	 https://github.com/lindenb/makefile2graph
url :
	 https://github.com/lindenb/makefile2graph/archive/v1.5.0.tar.gz
description :
	 Create a graph of dependencies from GNU-Make
build_deps :
link_deps :
	 graphviz
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "test"
	 bin.install "make2graph", "makefile2graph"
	 man1.install "make2graph.1", "makefile2graph.1"
	 doc.install "LICENSE", "README.md", "screenshot.png"
