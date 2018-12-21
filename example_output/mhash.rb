name :
	 Mhash
homepage :
	 https://mhash.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/mhash/mhash/0.9.9.9/mhash-0.9.9.9.tar.gz
description :
	 Uniform interface to a large number of hash algorithms
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
