name :
	 Ipsumdump
homepage :
	 https://read.seas.harvard.edu/~kohler/ipsumdump/
url :
	 https://read.seas.harvard.edu/~kohler/ipsumdump/ipsumdump-1.86.tar.gz
description :
	 Summarizes TCP/IP dump files into a self-describing ASCII format
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
