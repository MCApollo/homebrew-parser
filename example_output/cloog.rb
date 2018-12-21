name :
	 Cloog
homepage :
	 https://www.bastoul.net/cloog/
url :
	 https://www.bastoul.net/cloog/pages/download/count.php3?url=./cloog-0.18.4.tar.gz
description :
	 Generate code for scanning Z-polyhedra
build_deps :
	 pkg-config
link_deps :
	 gmp
conflicts :
patches :
EOF_patch :
install :
	 resource("isl").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{libexec}",
	 "--with-gmp=system",
	 "--with-gmp-prefix=#{Formula["gmp"].opt_prefix}"
	 system "make", "install"
