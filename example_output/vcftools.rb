name :
	 Vcftools
homepage :
	 https://vcftools.github.io/
url :
	 https://github.com/vcftools/vcftools/releases/download/v0.1.16/vcftools-0.1.16.tar.gz
description :
	 Tools for working with VCF files
build_deps :
	 pkg-config
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
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-pmdir=lib/perl5/site_perl"
	 system "make", "install"
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => lib/"perl5/site_perl")
