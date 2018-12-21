name :
	 Htslib
homepage :
	 https://www.htslib.org/
url :
	 https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2
description :
	 C library for high-throughput sequencing data formats
build_deps :
link_deps :
	 xz
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
	 pkgshare.install "test"
