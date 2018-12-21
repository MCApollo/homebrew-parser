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
