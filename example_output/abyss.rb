name :
	 Abyss
homepage :
	 http://www.bcgsc.ca/platform/bioinfo/software/abyss
url :
	 https://github.com/bcgsc/abyss/releases/download/2.1.5/abyss-2.1.5.tar.gz
description :
	 Genome sequence assembler for short reads
build_deps :
	 boost
	 google-sparsehash
link_deps :
	 gcc
	 open-mpi
optional_deps :
conflicts :
resource :
	 ['testdata']
	 ['http://www.bcgsc.ca/platform/bioinfo/software/abyss/releases/1.3.4/test-data.tar.gz']
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--enable-maxk=128",
	 "--prefix=#{prefix}",
	 "--with-boost=#{Formula["boost"].include}",
	 "--with-mpi=#{Formula["open-mpi"].prefix}",
	 "--with-sparsehash=#{Formula["google-sparsehash"].prefix}",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules"
	 system "make", "install"
