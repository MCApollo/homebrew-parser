name :
	 Bison
homepage :
	 https://www.gnu.org/software/bison/
url :
	 https://ftp.gnu.org/gnu/bison/bison-3.2.2.tar.gz
description :
	 Parser generator
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
