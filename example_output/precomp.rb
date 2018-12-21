name :
	 Precomp
homepage :
	 http://schnaader.info/precomp.php
url :
	 https://github.com/schnaader/precomp-cpp/archive/v0.4.6.tar.gz
description :
	 Command-line precompressor to achieve better compression
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile", " -s ", " "
	 system "make"
	 bin.install "precomp"
