name :
	 Lbzip2
homepage :
	 https://github.com/kjn/lbzip2
url :
	 http://archive.lbzip2.org/lbzip2-2.5.tar.bz2
description :
	 Parallel bzip2 utility
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
