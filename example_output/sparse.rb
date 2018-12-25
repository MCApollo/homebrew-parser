name :
	 Sparse
homepage :
	 https://sparse.wiki.kernel.org/
url :
	 https://www.kernel.org/pub/software/devel/sparse/dist/sparse-0.5.2.tar.xz
description :
	 Static C code analysis tool
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "Makefile", /PREFIX=\$\(HOME\)/, "PREFIX=#{prefix}"
	 system "make", "install"
