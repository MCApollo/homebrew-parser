name :
	 Mmix
homepage :
	 http://mmix.cs.hm.edu/
url :
	 http://mmix.cs.hm.edu/src/mmix-20160804.tgz
description :
	 64-bit RISC architecture designed by Donald Knuth
build_deps :
	 cweb
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "make", "all"
	 bin.install "mmix", "mmixal", "mmmix", "mmotype"
