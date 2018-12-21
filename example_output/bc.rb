name :
	 Bc
homepage :
	 https://www.gnu.org/software/bc/
url :
	 https://ftp.gnu.org/gnu/bc/bc-1.07.1.tar.gz
description :
	 Arbitrary precision numeric processing language
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.delete("BC_ENV_ARGS")
	 system "./configure",
	 "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--infodir=#{info}",
	 "--mandir=#{man}",
	 "--with-libedit"
	 system "make", "install"
