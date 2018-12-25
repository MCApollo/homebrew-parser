name :
	 Bcftools
homepage :
	 https://www.htslib.org/
url :
	 https://github.com/samtools/bcftools/releases/download/1.9/bcftools-1.9.tar.bz2
description :
	 Tools for BCF/VCF files and variant calling from samtools
build_deps :
link_deps :
	 gsl
	 htslib
	 xz
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--with-htslib=#{Formula["htslib"].opt_prefix}",
	 "--enable-libgsl"
	 system "make", "install"
	 pkgshare.install "test/query.vcf"
