name :
	 Seqtk
homepage :
	 https://github.com/lh3/seqtk
url :
	 https://github.com/lh3/seqtk/archive/v1.3.tar.gz
description :
	 Toolkit for processing sequences in FASTA/Q formats
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "seqtk"
