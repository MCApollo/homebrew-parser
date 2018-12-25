name :
	 Igraph
homepage :
	 https://igraph.org/
url :
	 https://igraph.org/nightly/get/c/igraph-0.7.1.tar.gz
description :
	 Network analysis package
build_deps :
link_deps :
	 glpk
	 gmp
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-external-blas",
	 "--with-external-lapack",
	 "--with-external-glpk"
	 system "make", "install"
