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
optional_deps :
conflicts :
resource :
	 ['testfile']
	 ['https://gist.githubusercontent.com/glsorre/9f67891c69c21cbf477c6cedff8ee910/raw/84ec65cf37e0a8df5428c6c607dbf397c2297e06/pict.txt']
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "pict"
