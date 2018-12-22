name :
	 Sratoolkit
homepage :
	 https://github.com/ncbi/sra-tools
url :
	 https://github.com/ncbi/sra-tools/archive/2.9.3.tar.gz
description :
	 Data tools for INSDC Sequence Read Archive
build_deps :
link_deps :
	 hdf5
	 libmagic
conflicts :
patches :
EOF_patch :
install :
	 ngs_sdk_prefix = buildpath/"ngs-sdk-prefix"
	 resource("ngs-sdk").stage do
	 cd "ngs-sdk" do
	 system "./configure",
	 "--prefix=#{ngs_sdk_prefix}",
	 "--build=#{buildpath}/ngs-sdk-build"
	 system "make"
	 system "make", "install"
	 end
	 end
	 ncbi_vdb_source = buildpath/"ncbi-vdb-source"
	 ncbi_vdb_build = buildpath/"ncbi-vdb-build"
	 ncbi_vdb_source.install resource("ncbi-vdb")
	 cd ncbi_vdb_source do
	 system "./configure",
	 "--prefix=#{buildpath/"ncbi-vdb-prefix"}",
	 "--with-ngs-sdk-prefix=#{ngs_sdk_prefix}",
	 "--build=#{ncbi_vdb_build}"
	 ENV.deparallelize { system "make" }
	 end
	 inreplace "tools/copycat/Makefile", "-smagic-static", "-smagic"
	 system "./configure",
	 "--prefix=#{prefix}",
	 "--with-ngs-sdk-prefix=#{ngs_sdk_prefix}",
	 "--with-ncbi-vdb-sources=#{ncbi_vdb_source}",
	 "--with-ncbi-vdb-build=#{ncbi_vdb_build}",
	 "--build=#{buildpath}/sra-tools-build"
	 system "make", "install"
	 rm_r [bin/"magic", bin/"ncbi"]
