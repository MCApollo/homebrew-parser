name :
	 Sickle
homepage :
	 https://github.com/najoshi/sickle
url :
	 https://github.com/najoshi/sickle/archive/v1.33.tar.gz
description :
	 Windowed adaptive trimming for FASTQ files using quality
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "sickle"
