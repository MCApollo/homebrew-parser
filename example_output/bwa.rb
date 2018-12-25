name :
	 Bwa
homepage :
	 https://github.com/lh3/bwa
url :
	 https://github.com/lh3/bwa/releases/download/v0.7.17/bwa-0.7.17.tar.bz2
description :
	 Burrow-Wheeler Aligner for pairwise alignment of DNA
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "bwa"
	 man1.install "bwa.1"
