name :
	 Lzip
homepage :
	 https://www.nongnu.org/lzip/
url :
	 https://download-mirror.savannah.gnu.org/releases/lzip/lzip-1.20.tar.gz
description :
	 LZMA-based compression program similar to gzip or bzip2
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "CXX=#{ENV.cxx}",
	 "CXXFLAGS=#{ENV.cflags}"
	 system "make", "check"
	 ENV.deparallelize
	 system "make", "install"
