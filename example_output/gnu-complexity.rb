name :
	 GnuComplexity
homepage :
	 https://www.gnu.org/software/complexity
url :
	 https://ftp.gnu.org/gnu/complexity/complexity-1.10.tar.xz
description :
	 Measures complexity of C source
build_deps :
link_deps :
	 autogen
	 gcc
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
