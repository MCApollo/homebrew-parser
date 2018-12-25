name :
	 Bowtie2
homepage :
	 https://bowtie-bio.sourceforge.io/bowtie2/
url :
	 https://github.com/BenLangmead/bowtie2/archive/v2.3.4.3.tar.gz
description :
	 Fast and sensitive gapped read aligner
build_deps :
link_deps :
	 tbb
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 tbb = Formula["tbb"]
	 system "make", "install", "WITH_TBB=1", "prefix=#{prefix}",
	 "EXTRA_FLAGS=-L #{tbb.opt_lib}", "INC=-I #{tbb.opt_include}"
	 pkgshare.install "example", "scripts"
