name :
	 Datamash
homepage :
	 https://www.gnu.org/software/datamash
url :
	 https://ftp.gnu.org/gnu/datamash/datamash-1.3.tar.gz
description :
	 Tool to perform numerical, textual & statistical operations
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./bootstrap" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
