name :
	 Blast
homepage :
	 https://blast.ncbi.nlm.nih.gov/
url :
	 https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.7.1+-src.tar.gz
description :
	 Basic Local Alignment Search Tool
build_deps :
link_deps :
	 lmdb
conflicts :
	 proj
patches :
EOF_patch :
install :
	 cd "c++" do
	 system "./configure", "--prefix=#{prefix}",
	 "--without-debug",
	 "--without-boost"
	 system "make"
	 system "make", "install"
