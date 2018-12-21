name :
	 Bedops
homepage :
	 https://github.com/bedops/bedops
url :
	 https://github.com/bedops/bedops/archive/v2.4.35.tar.gz
description :
	 Set and statistical operations on genomic data of arbitrary scale
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "BINDIR=#{bin}"
