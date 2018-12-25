name :
	 Kallisto
homepage :
	 https://pachterlab.github.io/kallisto/
url :
	 https://github.com/pachterlab/kallisto/archive/v0.45.0.tar.gz
description :
	 Quantify abundances of transcripts from RNA-Seq data
build_deps :
	 autoconf
	 automake
	 cmake
link_deps :
	 hdf5
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv", "ext/htslib"
	 system "cmake", ".", *std_cmake_args
	 system "make", "htslib"
	 system "make", "install"
