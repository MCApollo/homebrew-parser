name :
	 Xorriso
homepage :
	 https://www.gnu.org/software/xorriso/
url :
	 https://ftp.gnu.org/gnu/xorriso/xorriso-1.4.8.tar.gz
description :
	 ISO9660+RR manipulation tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 ENV.deparallelize { system "make", "install" }
