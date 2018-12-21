name :
	 Gperf
homepage :
	 https://www.gnu.org/software/gperf
url :
	 https://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz
description :
	 Perfect hash function generator
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
