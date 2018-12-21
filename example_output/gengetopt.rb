name :
	 Gengetopt
homepage :
	 https://www.gnu.org/software/gengetopt/
url :
	 https://ftp.gnu.org/gnu/gengetopt/gengetopt-2.22.6.tar.gz
description :
	 Generate C code to parse command-line arguments via getopt_long
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 ENV.deparallelize
	 system "make", "install"
