name :
	 Treecc
homepage :
	 https://gnu.org/software/dotgnu/treecc/treecc.html
url :
	 https://download.savannah.gnu.org/releases/dotgnu-pnet/treecc-0.3.10.tar.gz
description :
	 Aspect-oriented approach to writing compilers
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 bin.install "treecc"
