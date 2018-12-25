name :
	 Glpk
homepage :
	 https://www.gnu.org/software/glpk/
url :
	 https://ftp.gnu.org/gnu/glpk/glpk-4.65.tar.gz
description :
	 Library for Linear and Mixed-Integer Programming
build_deps :
link_deps :
	 gmp
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--with-gmp"
	 system "make", "install"
