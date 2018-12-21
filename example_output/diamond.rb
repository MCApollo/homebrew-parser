name :
	 Diamond
homepage :
	 https://ab.inf.uni-tuebingen.de/software/diamond/
url :
	 https://github.com/bbuchfink/diamond/archive/v0.9.22.tar.gz
description :
	 Accelerated BLAST compatible local sequence aligner
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
