name :
	 Pict
homepage :
	 https://github.com/Microsoft/pict/
url :
	 https://github.com/Microsoft/pict/archive/v3.7.1.tar.gz
description :
	 Pairwise Independent Combinatorial Tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "pict"
