name :
	 Samtools
homepage :
	 https://www.htslib.org/
url :
	 https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2
description :
	 Tools for manipulating next-generation sequencing data
build_deps :
link_deps :
	 htslib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--with-htslib=#{Formula["htslib"].opt_prefix}"
	 system "make", "install"
