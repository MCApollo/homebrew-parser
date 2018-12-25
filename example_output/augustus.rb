name :
	 Augustus
homepage :
	 http://bioinf.uni-greifswald.de/augustus/
url :
	 http://bioinf.uni-greifswald.de/augustus/binaries/augustus-3.3.2.tar.gz
description :
	 Predict genes in eukaryotic genomic sequences
build_deps :
link_deps :
	 bamtools
	 boost
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "auxprogs/Makefile", "cd bam2wig; make;", "#cd bam2wig; make;"
	 inreplace "auxprogs/bam2hints/Makefile",
	 "INCLUDES = /usr/include/bamtools",
	 "INCLUDES = #{Formula["bamtools"].include/"bamtools"}"
	 inreplace "auxprogs/filterBam/src/Makefile",
	 "BAMTOOLS = /usr/include/bamtools",
	 "BAMTOOLS= #{Formula["bamtools"].include/"bamtools"}"
	 inreplace "Makefile", %r{ln -sf.*/usr/local/bin/}, "#ln -sf"
	 system "make", "clean"
	 system "make"
	 system "make", "install", "INSTALLDIR=#{prefix}"
	 bin.env_script_all_files libexec/"bin", :AUGUSTUS_CONFIG_PATH => prefix/"config"
