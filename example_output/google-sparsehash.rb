name :
	 GoogleSparsehash
homepage :
	 https://github.com/sparsehash/sparsehash
url :
	 https://github.com/sparsehash/sparsehash/archive/sparsehash-2.0.3.tar.gz
description :
	 Extremely memory-efficient hash_map implementation
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "check"
	 system "make", "install"
